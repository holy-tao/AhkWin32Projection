#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The EnumMetaFileProc function is an application-defined callback function that processes Windows-format metafile records.
 * @remarks
 * An application must register the callback function by passing its address to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enummetafile">EnumMetaFile</a> function.
 * 
 * <b>EnumMetaFileProc</b> is a placeholder for the application-supplied function name.
 * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nc-wingdi-mfenumproc
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class MFENUMPROC extends IUnknown {

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
     * @param {HDC} hdc_ 
     * @param {Pointer<HANDLETABLE>} lpht 
     * @param {Pointer<METARECORD>} lpMR 
     * @param {Integer} nObj 
     * @param {LPARAM} param4 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hdc_, lpht, lpMR, nObj, param4) {
        hdc_ := hdc_ is Win32Handle ? NumGet(hdc_, "ptr") : hdc_
        param4 := param4 is Win32Handle ? NumGet(param4, "ptr") : param4

        result := ComCall(3, this, "ptr", hdc_, "ptr", lpht, "ptr", lpMR, "int", nObj, "ptr", param4, "int")
        return result
    }
}
