#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class ICodecSubtypesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICodecSubtypesStatics
     * @type {Guid}
     */
    static IID => Guid("{a66ac4f2-888b-4224-8cf6-2a8d4eb02382}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_VideoFormatDV25", "get_VideoFormatDV50", "get_VideoFormatDvc", "get_VideoFormatDvh1", "get_VideoFormatDvhD", "get_VideoFormatDvsd", "get_VideoFormatDvsl", "get_VideoFormatH263", "get_VideoFormatH264", "get_VideoFormatH265", "get_VideoFormatH264ES", "get_VideoFormatHevc", "get_VideoFormatHevcES", "get_VideoFormatM4S2", "get_VideoFormatMjpg", "get_VideoFormatMP43", "get_VideoFormatMP4S", "get_VideoFormatMP4V", "get_VideoFormatMpeg2", "get_VideoFormatVP80", "get_VideoFormatVP90", "get_VideoFormatMpg1", "get_VideoFormatMss1", "get_VideoFormatMss2", "get_VideoFormatWmv1", "get_VideoFormatWmv2", "get_VideoFormatWmv3", "get_VideoFormatWvc1", "get_VideoFormat420O", "get_AudioFormatAac", "get_AudioFormatAdts", "get_AudioFormatAlac", "get_AudioFormatAmrNB", "get_AudioFormatAmrWB", "get_AudioFormatAmrWP", "get_AudioFormatDolbyAC3", "get_AudioFormatDolbyAC3Spdif", "get_AudioFormatDolbyDDPlus", "get_AudioFormatDrm", "get_AudioFormatDts", "get_AudioFormatFlac", "get_AudioFormatFloat", "get_AudioFormatMP3", "get_AudioFormatMPeg", "get_AudioFormatMsp1", "get_AudioFormatOpus", "get_AudioFormatPcm", "get_AudioFormatWmaSpdif", "get_AudioFormatWMAudioLossless", "get_AudioFormatWMAudioV8", "get_AudioFormatWMAudioV9"]

    /**
     * @type {HSTRING} 
     */
    VideoFormatDV25 {
        get => this.get_VideoFormatDV25()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatDV50 {
        get => this.get_VideoFormatDV50()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatDvc {
        get => this.get_VideoFormatDvc()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatDvh1 {
        get => this.get_VideoFormatDvh1()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatDvhD {
        get => this.get_VideoFormatDvhD()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatDvsd {
        get => this.get_VideoFormatDvsd()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatDvsl {
        get => this.get_VideoFormatDvsl()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatH263 {
        get => this.get_VideoFormatH263()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatH264 {
        get => this.get_VideoFormatH264()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatH265 {
        get => this.get_VideoFormatH265()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatH264ES {
        get => this.get_VideoFormatH264ES()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatHevc {
        get => this.get_VideoFormatHevc()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatHevcES {
        get => this.get_VideoFormatHevcES()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatM4S2 {
        get => this.get_VideoFormatM4S2()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatMjpg {
        get => this.get_VideoFormatMjpg()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatMP43 {
        get => this.get_VideoFormatMP43()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatMP4S {
        get => this.get_VideoFormatMP4S()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatMP4V {
        get => this.get_VideoFormatMP4V()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatMpeg2 {
        get => this.get_VideoFormatMpeg2()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatVP80 {
        get => this.get_VideoFormatVP80()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatVP90 {
        get => this.get_VideoFormatVP90()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatMpg1 {
        get => this.get_VideoFormatMpg1()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatMss1 {
        get => this.get_VideoFormatMss1()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatMss2 {
        get => this.get_VideoFormatMss2()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatWmv1 {
        get => this.get_VideoFormatWmv1()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatWmv2 {
        get => this.get_VideoFormatWmv2()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatWmv3 {
        get => this.get_VideoFormatWmv3()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormatWvc1 {
        get => this.get_VideoFormatWvc1()
    }

    /**
     * @type {HSTRING} 
     */
    VideoFormat420O {
        get => this.get_VideoFormat420O()
    }

    /**
     * @type {HSTRING} 
     */
    AudioFormatAac {
        get => this.get_AudioFormatAac()
    }

    /**
     * @type {HSTRING} 
     */
    AudioFormatAdts {
        get => this.get_AudioFormatAdts()
    }

    /**
     * @type {HSTRING} 
     */
    AudioFormatAlac {
        get => this.get_AudioFormatAlac()
    }

    /**
     * @type {HSTRING} 
     */
    AudioFormatAmrNB {
        get => this.get_AudioFormatAmrNB()
    }

    /**
     * @type {HSTRING} 
     */
    AudioFormatAmrWB {
        get => this.get_AudioFormatAmrWB()
    }

    /**
     * @type {HSTRING} 
     */
    AudioFormatAmrWP {
        get => this.get_AudioFormatAmrWP()
    }

    /**
     * @type {HSTRING} 
     */
    AudioFormatDolbyAC3 {
        get => this.get_AudioFormatDolbyAC3()
    }

    /**
     * @type {HSTRING} 
     */
    AudioFormatDolbyAC3Spdif {
        get => this.get_AudioFormatDolbyAC3Spdif()
    }

    /**
     * @type {HSTRING} 
     */
    AudioFormatDolbyDDPlus {
        get => this.get_AudioFormatDolbyDDPlus()
    }

    /**
     * @type {HSTRING} 
     */
    AudioFormatDrm {
        get => this.get_AudioFormatDrm()
    }

    /**
     * @type {HSTRING} 
     */
    AudioFormatDts {
        get => this.get_AudioFormatDts()
    }

    /**
     * @type {HSTRING} 
     */
    AudioFormatFlac {
        get => this.get_AudioFormatFlac()
    }

    /**
     * @type {HSTRING} 
     */
    AudioFormatFloat {
        get => this.get_AudioFormatFloat()
    }

    /**
     * @type {HSTRING} 
     */
    AudioFormatMP3 {
        get => this.get_AudioFormatMP3()
    }

    /**
     * @type {HSTRING} 
     */
    AudioFormatMPeg {
        get => this.get_AudioFormatMPeg()
    }

    /**
     * @type {HSTRING} 
     */
    AudioFormatMsp1 {
        get => this.get_AudioFormatMsp1()
    }

    /**
     * @type {HSTRING} 
     */
    AudioFormatOpus {
        get => this.get_AudioFormatOpus()
    }

    /**
     * @type {HSTRING} 
     */
    AudioFormatPcm {
        get => this.get_AudioFormatPcm()
    }

    /**
     * @type {HSTRING} 
     */
    AudioFormatWmaSpdif {
        get => this.get_AudioFormatWmaSpdif()
    }

    /**
     * @type {HSTRING} 
     */
    AudioFormatWMAudioLossless {
        get => this.get_AudioFormatWMAudioLossless()
    }

    /**
     * @type {HSTRING} 
     */
    AudioFormatWMAudioV8 {
        get => this.get_AudioFormatWMAudioV8()
    }

    /**
     * @type {HSTRING} 
     */
    AudioFormatWMAudioV9 {
        get => this.get_AudioFormatWMAudioV9()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_VideoFormatDV25() {
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
    get_VideoFormatDV50() {
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
    get_VideoFormatDvc() {
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
    get_VideoFormatDvh1() {
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
    get_VideoFormatDvhD() {
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
    get_VideoFormatDvsd() {
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
    get_VideoFormatDvsl() {
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
    get_VideoFormatH263() {
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
    get_VideoFormatH264() {
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
    get_VideoFormatH265() {
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
    get_VideoFormatH264ES() {
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
    get_VideoFormatHevc() {
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
    get_VideoFormatHevcES() {
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
    get_VideoFormatM4S2() {
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
    get_VideoFormatMjpg() {
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
    get_VideoFormatMP43() {
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
    get_VideoFormatMP4S() {
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
    get_VideoFormatMP4V() {
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
    get_VideoFormatMpeg2() {
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
    get_VideoFormatVP80() {
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
    get_VideoFormatVP90() {
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
    get_VideoFormatMpg1() {
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
    get_VideoFormatMss1() {
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
    get_VideoFormatMss2() {
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
    get_VideoFormatWmv1() {
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
    get_VideoFormatWmv2() {
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
    get_VideoFormatWmv3() {
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
    get_VideoFormatWvc1() {
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
    get_VideoFormat420O() {
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
    get_AudioFormatAac() {
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
    get_AudioFormatAdts() {
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
    get_AudioFormatAlac() {
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
    get_AudioFormatAmrNB() {
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
    get_AudioFormatAmrWB() {
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
    get_AudioFormatAmrWP() {
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
    get_AudioFormatDolbyAC3() {
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
    get_AudioFormatDolbyAC3Spdif() {
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
    get_AudioFormatDolbyDDPlus() {
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
    get_AudioFormatDrm() {
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
    get_AudioFormatDts() {
        value := HSTRING()
        result := ComCall(45, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AudioFormatFlac() {
        value := HSTRING()
        result := ComCall(46, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AudioFormatFloat() {
        value := HSTRING()
        result := ComCall(47, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AudioFormatMP3() {
        value := HSTRING()
        result := ComCall(48, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AudioFormatMPeg() {
        value := HSTRING()
        result := ComCall(49, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AudioFormatMsp1() {
        value := HSTRING()
        result := ComCall(50, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AudioFormatOpus() {
        value := HSTRING()
        result := ComCall(51, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AudioFormatPcm() {
        value := HSTRING()
        result := ComCall(52, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AudioFormatWmaSpdif() {
        value := HSTRING()
        result := ComCall(53, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AudioFormatWMAudioLossless() {
        value := HSTRING()
        result := ComCall(54, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AudioFormatWMAudioV8() {
        value := HSTRING()
        result := ComCall(55, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AudioFormatWMAudioV9() {
        value := HSTRING()
        result := ComCall(56, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
