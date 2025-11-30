#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The HistogramFormat enumeration specifies the number and type of histograms that represent the color channels of a bitmap. This enumeration is used with the Bitmap::GetHistogram method.
 * @see https://docs.microsoft.com/windows/win32/api//gdipluscolormatrix/ne-gdipluscolormatrix-histogramformat
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class HistogramFormat extends Win32Enum{

    /**
     * Specifies that the <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nf-gdiplusheaders-bitmap-gethistogram">Bitmap::GetHistogram</a> method returns four histograms: one each for the alpha, red, green, and blue channels. The alpha-channel histogram is written to the buffer pointed to by the <i>channel0</i> parameter of the <b>Bitmap::GetHistogram</b> method. The red-channel histogram is written to the buffer pointed to by the <i>channel1</i> parameter. The green-channel histogram is written to the buffer pointed to by the <i>channel2</i> parameter.  The blue-channel histogram is written to the buffer pointed to by the <i>channel3</i> parameter.
     * @type {Integer (Int32)}
     */
    static HistogramFormatARGB => 0

    /**
     * Specifies that the <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nf-gdiplusheaders-bitmap-gethistogram">Bitmap::GetHistogram</a> method returns four histograms: one each for the alpha, red, green, and blue channels. The red, green, and blue channels are each multiplied by the alpha channel before the histograms are created. The bitmap is not permanently altered when the color channels are multiplied by the alpha channel; that multiplication is only for the purpose of creating the histograms. The alpha-channel histogram is written to the buffer pointed to by the <i>channel0</i> parameter of the <b>Bitmap::GetHistogram</b> method. The red-channel histogram is written to the buffer pointed to by the <i>channel1</i> parameter. The green-channel histogram is written to the buffer pointed to by the <i>channel2</i> parameter.  The blue-channel histogram is written to the buffer pointed to by the <i>channel3</i> parameter.
     * @type {Integer (Int32)}
     */
    static HistogramFormatPARGB => 1

    /**
     * Specifies that the <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nf-gdiplusheaders-bitmap-gethistogram">Bitmap::GetHistogram</a> method returns three histograms: one each for the red, green, and blue channels. The red-channel histogram is written to the buffer pointed to by the <i>channel0</i> parameter of the <b>Bitmap::GetHistogram</b> method. The green-channel histogram is written to the buffer pointed to by the <i>channel1</i> parameter. The blue-channel histogram is written to the buffer pointed to by the <i>channel2</i> parameter.  The <i>channel3</i> parameter must be set to <b>NULL</b>.
     * @type {Integer (Int32)}
     */
    static HistogramFormatRGB => 2

    /**
     * Specifies that each pixel is converted to a grayscale value in the range 0 through 255, and then one histogram, based on those grayscale value, is returned. The bitmap is not permanently altered by the conversion to grayscale values; those values are calculated only for the purpose of creating the histogram. The grayscale histogram is written to the buffer pointed to by the <i>channel0</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nf-gdiplusheaders-bitmap-gethistogram">Bitmap::GetHistogram</a> method. The <i>channel1</i>, <i>channel2</i>, and <i>channel3</i> parameters must be set to <b>NULL</b>.
     * @type {Integer (Int32)}
     */
    static HistogramFormatGray => 3

    /**
     * Specifies that the <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nf-gdiplusheaders-bitmap-gethistogram">Bitmap::GetHistogram</a> method returns a histogram for the blue channel. The blue-channel histogram is written to the buffer pointed to by the <i>channel0</i> parameter of the <b>Bitmap::GetHistogram</b> method. The <i>channel1</i>, <i>channel2</i>, and <i>channel3</i> parameters must be set to <b>NULL</b>.
     * @type {Integer (Int32)}
     */
    static HistogramFormatB => 4

    /**
     * Specifies that the <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nf-gdiplusheaders-bitmap-gethistogram">Bitmap::GetHistogram</a> method returns a histogram for the green channel. The green-channel histogram is written to the buffer pointed to by the <i>channel0</i> parameter of the <b>Bitmap::GetHistogram</b> method. The <i>channel1</i>, <i>channel2</i>, and <i>channel3</i> parameters must be set to <b>NULL</b>.
     * @type {Integer (Int32)}
     */
    static HistogramFormatG => 5

    /**
     * Specifies that the <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nf-gdiplusheaders-bitmap-gethistogram">Bitmap::GetHistogram</a> method returns a histogram for the red channel. The red-channel histogram is written to the buffer pointed to by the <i>channel0</i> parameter of the <b>Bitmap::GetHistogram</b> method. The <i>channel1</i>, <i>channel2</i>, and <i>channel3</i> parameters must be set to <b>NULL</b>.
     * @type {Integer (Int32)}
     */
    static HistogramFormatR => 6

    /**
     * Specifies that the <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nf-gdiplusheaders-bitmap-gethistogram">Bitmap::GetHistogram</a> method returns a histogram for the alpha channel. The alpha-channel histogram is written to the buffer pointed to by the <i>channel0</i> parameter of the <b>Bitmap::GetHistogram</b> method. The <i>channel1</i>, <i>channel2</i>, and <i>channel3</i> parameters must be set to <b>NULL</b>.
     * @type {Integer (Int32)}
     */
    static HistogramFormatA => 7
}
