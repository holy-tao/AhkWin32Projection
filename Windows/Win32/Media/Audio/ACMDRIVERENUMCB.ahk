#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The acmDriverEnumCallback function specifies a callback function used with the acmDriverEnum function. The acmDriverEnumCallback name is a placeholder for an application-defined function name.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmdriverenum">acmDriverEnum</a> function will return MMSYSERR_NOERROR (zero) if no ACM drivers are installed. Moreover, the callback function will not be called.
 * 
 * The following functions should not be called from within the callback function: <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmdriveradd">acmDriverAdd</a>, <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmdriverremove">acmDriverRemove</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmdriverpriority">acmDriverPriority</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/msacm/nc-msacm-acmdriverenumcb
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ACMDRIVERENUMCB extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HACMDRIVERID} hadid 
     * @param {Pointer} dwInstance 
     * @param {Integer} fdwSupport 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hadid, dwInstance, fdwSupport) {
        hadid := hadid is Win32Handle ? NumGet(hadid, "ptr") : hadid

        result := ComCall(3, this, "ptr", hadid, "ptr", dwInstance, "uint", fdwSupport, "int")
        return result
    }
}
