#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\LRESULT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The capErrorCallback function is the error callback function used with video capture. The name capErrorCallback is a placeholder for the application-supplied function name. (Unicode)
 * @remarks
 * A message identifier of zero indicates a new operation is starting and the callback function should clear the current error.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The vfw.h header defines CAPERRORCALLBACK as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api//content/vfw/nc-vfw-caperrorcallbackw
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 * @charset Unicode
 */
class CAPERRORCALLBACKW extends IUnknown {

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
     * @param {HWND} hWnd_ 
     * @param {Integer} nID 
     * @param {PWSTR} lpsz 
     * @returns {LRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hWnd_, nID, lpsz) {
        hWnd_ := hWnd_ is Win32Handle ? NumGet(hWnd_, "ptr") : hWnd_
        lpsz := lpsz is String ? StrPtr(lpsz) : lpsz

        result := ComCall(3, this, "ptr", hWnd_, "int", nID, "ptr", lpsz, "ptr")
        resultHandle := LRESULT({Value: result}, True)
        return resultHandle
    }
}
