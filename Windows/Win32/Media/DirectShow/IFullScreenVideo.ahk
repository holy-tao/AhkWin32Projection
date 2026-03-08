#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IFullScreenVideoEx interface is implemented on the Full Screen Renderer filter, which provides full-screen video rendering on older hardware.
 * @see https://learn.microsoft.com/windows/win32/api/amvideo/nn-amvideo-ifullscreenvideoex
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IFullScreenVideo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFullScreenVideo
     * @type {Guid}
     */
    static IID => Guid("{dd1d7110-7836-11cf-bf47-00aa0055595a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CountModes", "GetModeInfo", "GetCurrentMode", "IsModeAvailable", "IsModeEnabled", "SetEnabled", "GetClipFactor", "SetClipFactor", "SetMessageDrain", "GetMessageDrain", "SetMonitor", "GetMonitor", "HideOnDeactivate", "IsHideOnDeactivate", "SetCaption", "GetCaption", "SetDefault"]

    /**
     * 
     * @returns {Integer} 
     */
    CountModes() {
        result := ComCall(3, this, "int*", &pModes := 0, "HRESULT")
        return pModes
    }

    /**
     * 
     * @param {Integer} Mode 
     * @param {Pointer<Integer>} pWidth 
     * @param {Pointer<Integer>} pHeight 
     * @param {Pointer<Integer>} pDepth 
     * @returns {HRESULT} 
     */
    GetModeInfo(Mode, pWidth, pHeight, pDepth) {
        pWidthMarshal := pWidth is VarRef ? "int*" : "ptr"
        pHeightMarshal := pHeight is VarRef ? "int*" : "ptr"
        pDepthMarshal := pDepth is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "int", Mode, pWidthMarshal, pWidth, pHeightMarshal, pHeight, pDepthMarshal, pDepth, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentMode() {
        result := ComCall(5, this, "int*", &pMode := 0, "HRESULT")
        return pMode
    }

    /**
     * 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     */
    IsModeAvailable(Mode) {
        result := ComCall(6, this, "int", Mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     */
    IsModeEnabled(Mode) {
        result := ComCall(7, this, "int", Mode, "HRESULT")
        return result
    }

    /**
     * Enables one or more Unicode point ranges on the context.
     * @remarks
     * The <b>SetEnabledUnicodeRanges</b> function is optional.
     * 
     * Some recognizers do not support enabling and disabling specific code points, but may still include the <b>SetEnabledUnicodeRanges</b> function. For such recognizers, the <b>SetEnabledUnicodeRanges</b> function returns E_NOTIMPL.
     * 
     * Each recognizer supports one or more Unicode point ranges. To determine which Unicode point ranges the recognizer supports, call the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-getunicoderanges">GetUnicodeRanges</a> function. If you do not call this function, the recognizer uses a default set of Unicode point ranges. The default ranges are recognizer specific.
     * 
     * The Microsoft gesture recognizer uses Unicode characters from 0xF000 to 0xF0FF. Each single Unicode value in this range represents a single gesture. For a complete list of Unicode values for gestures, see <a href="https://docs.microsoft.com/windows/desktop/tablet/unicode-range-values-of-gestures">Unicode Range Values of Gestures</a>.
     * @param {Integer} Mode 
     * @param {Integer} bEnabled 
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_S_TRUNCATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer does not support one of the specified Unicode point ranges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-setenabledunicoderanges
     */
    SetEnabled(Mode, bEnabled) {
        result := ComCall(8, this, "int", Mode, "int", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetClipFactor() {
        result := ComCall(9, this, "int*", &pClipFactor := 0, "HRESULT")
        return pClipFactor
    }

    /**
     * 
     * @param {Integer} ClipFactor 
     * @returns {HRESULT} 
     */
    SetClipFactor(ClipFactor) {
        result := ComCall(10, this, "int", ClipFactor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     */
    SetMessageDrain(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(11, this, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HWND} 
     */
    GetMessageDrain() {
        hwnd := HWND()
        result := ComCall(12, this, "ptr", hwnd, "HRESULT")
        return hwnd
    }

    /**
     * Sets a monitor's brightness value.
     * @remarks
     * If this function is supported, the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities">GetMonitorCapabilities</a> function returns the MC_CAPS_BRIGHTNESS flag.
     *       
     * 
     * This function takes about 50 milliseconds to return.
     *       
     * 
     * The brightness setting is a continuous monitor setting. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Monitor/using-the-high-level-monitor-configuration-functions">Using the High-Level Monitor Configuration Functions</a>.
     * @param {Integer} Monitor 
     * @returns {HRESULT} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-setmonitorbrightness
     */
    SetMonitor(Monitor) {
        result := ComCall(13, this, "int", Monitor, "HRESULT")
        return result
    }

    /**
     * Retrieves a monitor's minimum, maximum, and current brightness settings.
     * @remarks
     * If this function is supported, the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities">GetMonitorCapabilities</a> function returns the MC_CAPS_BRIGHTNESS flag.
     *       
     * 
     * This function takes about 40 milliseconds to return.
     *       
     * 
     * The brightness setting is a continuous monitor setting. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Monitor/using-the-high-level-monitor-configuration-functions">Using the High-Level Monitor Configuration Functions</a>.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorbrightness
     */
    GetMonitor() {
        result := ComCall(14, this, "int*", &Monitor := 0, "HRESULT")
        return Monitor
    }

    /**
     * 
     * @param {Integer} Hide 
     * @returns {HRESULT} 
     */
    HideOnDeactivate(Hide) {
        result := ComCall(15, this, "int", Hide, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsHideOnDeactivate() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strCaption 
     * @returns {HRESULT} 
     */
    SetCaption(strCaption) {
        strCaption := strCaption is String ? BSTR.Alloc(strCaption).Value : strCaption

        result := ComCall(17, this, "ptr", strCaption, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetCaption() {
        pstrCaption := BSTR()
        result := ComCall(18, this, "ptr", pstrCaption, "HRESULT")
        return pstrCaption
    }

    /**
     * Sets the default configuration for a communications device. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The winbase.h header defines SetDefaultCommConfig as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setdefaultcommconfigw
     */
    SetDefault() {
        result := ComCall(19, this, "HRESULT")
        return result
    }
}
