#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\SCANWINDOW.ahk" { SCANWINDOW }
#Import ".\RANGEVALUE.ahk" { RANGEVALUE }

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct SCANINFO {
    #StructPack 8

    ADF : Int32

    TPA : Int32

    Endorser : Int32

    OpticalXResolution : Int32

    OpticalYResolution : Int32

    BedWidth : Int32

    BedHeight : Int32

    IntensityRange : RANGEVALUE

    ContrastRange : RANGEVALUE

    SupportedCompressionType : Int32

    SupportedDataTypes : Int32

    WidthPixels : Int32

    WidthBytes : Int32

    Lines : Int32

    DataType : Int32

    PixelBits : Int32

    Intensity : Int32

    Contrast : Int32

    Xresolution : Int32

    Yresolution : Int32

    Window : SCANWINDOW

    DitherPattern : Int32

    Negative : Int32

    Mirror : Int32

    AutoBack : Int32

    ColorDitherPattern : Int32

    ToneMap : Int32

    Compression : Int32

    RawDataFormat : Int32

    RawPixelOrder : Int32

    bNeedDataAlignment : Int32

    DelayBetweenRead : Int32

    MaxBufferSize : Int32

    DeviceIOHandles : HANDLE[16]

    lReserved : Int32[4]

    pMicroDriverContext : IntPtr

}
