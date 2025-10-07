import numpy as np
import soundfile as sf

sr = 48000        # サンプリング周波数
duration = 60     # 1分
t = np.linspace(0, duration, int(sr*duration), endpoint=False)

# 複数の「楽器っぽい」波形
piano = 0.3 * np.sin(2*np.pi*440*t) * np.exp(-t/10)          # ピアノ風 (A4 減衰)
bass  = 0.2 * np.sin(2*np.pi*110*t)                          # ベース風 (A2)
guitar = 0.2 * np.sin(2*np.pi*329.63*t) * np.sin(2*np.pi*2*t) # ギター風 (E4, ビブラート)
drums = 0.1 * (np.random.randn(len(t)) * (np.sin(2*np.pi*2*t) > 0)) # ドラム風ノイズ

# ミックス
mix = piano + bass + guitar + drums
mix = mix / np.max(np.abs(mix))  # 正規化

# 24bit 相当で保存（実際は32bit intに格納）
sf.write("multi_instruments.wav", mix, sr, subtype='PCM_24')
print("multi_instruments.wav を生成しました")
