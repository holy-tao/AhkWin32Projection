#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IMediaEncodingSubtypesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaEncodingSubtypesStatics
     * @type {Guid}
     */
    static IID => Guid("{37b6580e-a171-4464-ba5a-53189e48c1c8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Aac", "get_AacAdts", "get_Ac3", "get_AmrNb", "get_AmrWb", "get_Argb32", "get_Asf", "get_Avi", "get_Bgra8", "get_Bmp", "get_Eac3", "get_Float", "get_Gif", "get_H263", "get_H264", "get_H264Es", "get_Hevc", "get_HevcEs", "get_Iyuv", "get_Jpeg", "get_JpegXr", "get_Mjpg", "get_Mpeg", "get_Mpeg1", "get_Mpeg2", "get_Mp3", "get_Mpeg4", "get_Nv12", "get_Pcm", "get_Png", "get_Rgb24", "get_Rgb32", "get_Tiff", "get_Wave", "get_Wma8", "get_Wma9", "get_Wmv3", "get_Wvc1", "get_Yuy2", "get_Yv12"]

    /**
     * @type {HSTRING} 
     */
    Aac {
        get => this.get_Aac()
    }

    /**
     * @type {HSTRING} 
     */
    AacAdts {
        get => this.get_AacAdts()
    }

    /**
     * @type {HSTRING} 
     */
    Ac3 {
        get => this.get_Ac3()
    }

    /**
     * @type {HSTRING} 
     */
    AmrNb {
        get => this.get_AmrNb()
    }

    /**
     * @type {HSTRING} 
     */
    AmrWb {
        get => this.get_AmrWb()
    }

    /**
     * @type {HSTRING} 
     */
    Argb32 {
        get => this.get_Argb32()
    }

    /**
     * @type {HSTRING} 
     */
    Asf {
        get => this.get_Asf()
    }

    /**
     * @type {HSTRING} 
     */
    Avi {
        get => this.get_Avi()
    }

    /**
     * @type {HSTRING} 
     */
    Bgra8 {
        get => this.get_Bgra8()
    }

    /**
     * @type {HSTRING} 
     */
    Bmp {
        get => this.get_Bmp()
    }

    /**
     * @type {HSTRING} 
     */
    Eac3 {
        get => this.get_Eac3()
    }

    /**
     * @type {HSTRING} 
     */
    Float {
        get => this.get_Float()
    }

    /**
     * @type {HSTRING} 
     */
    Gif {
        get => this.get_Gif()
    }

    /**
     * @type {HSTRING} 
     */
    H263 {
        get => this.get_H263()
    }

    /**
     * @type {HSTRING} 
     */
    H264 {
        get => this.get_H264()
    }

    /**
     * @type {HSTRING} 
     */
    H264Es {
        get => this.get_H264Es()
    }

    /**
     * @type {HSTRING} 
     */
    Hevc {
        get => this.get_Hevc()
    }

    /**
     * @type {HSTRING} 
     */
    HevcEs {
        get => this.get_HevcEs()
    }

    /**
     * @type {HSTRING} 
     */
    Iyuv {
        get => this.get_Iyuv()
    }

    /**
     * @type {HSTRING} 
     */
    Jpeg {
        get => this.get_Jpeg()
    }

    /**
     * @type {HSTRING} 
     */
    JpegXr {
        get => this.get_JpegXr()
    }

    /**
     * @type {HSTRING} 
     */
    Mjpg {
        get => this.get_Mjpg()
    }

    /**
     * @type {HSTRING} 
     */
    Mpeg {
        get => this.get_Mpeg()
    }

    /**
     * @type {HSTRING} 
     */
    Mpeg1 {
        get => this.get_Mpeg1()
    }

    /**
     * @type {HSTRING} 
     */
    Mpeg2 {
        get => this.get_Mpeg2()
    }

    /**
     * @type {HSTRING} 
     */
    Mp3 {
        get => this.get_Mp3()
    }

    /**
     * @type {HSTRING} 
     */
    Mpeg4 {
        get => this.get_Mpeg4()
    }

    /**
     * @type {HSTRING} 
     */
    Nv12 {
        get => this.get_Nv12()
    }

    /**
     * @type {HSTRING} 
     */
    Pcm {
        get => this.get_Pcm()
    }

    /**
     * @type {HSTRING} 
     */
    Png {
        get => this.get_Png()
    }

    /**
     * @type {HSTRING} 
     */
    Rgb24 {
        get => this.get_Rgb24()
    }

    /**
     * @type {HSTRING} 
     */
    Rgb32 {
        get => this.get_Rgb32()
    }

    /**
     * @type {HSTRING} 
     */
    Tiff {
        get => this.get_Tiff()
    }

    /**
     * @type {HSTRING} 
     */
    Wave {
        get => this.get_Wave()
    }

    /**
     * @type {HSTRING} 
     */
    Wma8 {
        get => this.get_Wma8()
    }

    /**
     * @type {HSTRING} 
     */
    Wma9 {
        get => this.get_Wma9()
    }

    /**
     * @type {HSTRING} 
     */
    Wmv3 {
        get => this.get_Wmv3()
    }

    /**
     * @type {HSTRING} 
     */
    Wvc1 {
        get => this.get_Wvc1()
    }

    /**
     * @type {HSTRING} 
     */
    Yuy2 {
        get => this.get_Yuy2()
    }

    /**
     * @type {HSTRING} 
     */
    Yv12 {
        get => this.get_Yv12()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Aac() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AacAdts() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Ac3() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AmrNb() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AmrWb() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Argb32() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Asf() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Avi() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Bgra8() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Bmp() {
        value := HSTRING()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Eac3() {
        value := HSTRING()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Float() {
        value := HSTRING()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Gif() {
        value := HSTRING()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_H263() {
        value := HSTRING()
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_H264() {
        value := HSTRING()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_H264Es() {
        value := HSTRING()
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Hevc() {
        value := HSTRING()
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HevcEs() {
        value := HSTRING()
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Iyuv() {
        value := HSTRING()
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Jpeg() {
        value := HSTRING()
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_JpegXr() {
        value := HSTRING()
        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Mjpg() {
        value := HSTRING()
        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Mpeg() {
        value := HSTRING()
        result := ComCall(28, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Mpeg1() {
        value := HSTRING()
        result := ComCall(29, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Mpeg2() {
        value := HSTRING()
        result := ComCall(30, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Mp3() {
        value := HSTRING()
        result := ComCall(31, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Mpeg4() {
        value := HSTRING()
        result := ComCall(32, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Nv12() {
        value := HSTRING()
        result := ComCall(33, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Pcm() {
        value := HSTRING()
        result := ComCall(34, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Png() {
        value := HSTRING()
        result := ComCall(35, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Rgb24() {
        value := HSTRING()
        result := ComCall(36, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Rgb32() {
        value := HSTRING()
        result := ComCall(37, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Tiff() {
        value := HSTRING()
        result := ComCall(38, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Wave() {
        value := HSTRING()
        result := ComCall(39, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Wma8() {
        value := HSTRING()
        result := ComCall(40, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Wma9() {
        value := HSTRING()
        result := ComCall(41, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Wmv3() {
        value := HSTRING()
        result := ComCall(42, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Wvc1() {
        value := HSTRING()
        result := ComCall(43, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Yuy2() {
        value := HSTRING()
        result := ComCall(44, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Yv12() {
        value := HSTRING()
        result := ComCall(45, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
