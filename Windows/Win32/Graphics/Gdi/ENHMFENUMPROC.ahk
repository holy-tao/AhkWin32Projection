#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The EnhMetaFileProc function is an application-defined callback function used with the EnumEnhMetaFile function.
 * @remarks
 * An application must register the callback function by passing its address to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enumenhmetafile">EnumEnhMetaFile</a> function.
 * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nc-wingdi-enhmfenumproc
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class ENHMFENUMPROC extends IUnknown {

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
     * @param {Pointer<ENHMETARECORD>} lpmr 
     * @param {Integer} nHandles 
     * @param {LPARAM} data 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hdc_, lpht, lpmr, nHandles, data) {
        hdc_ := hdc_ is Win32Handle ? NumGet(hdc_, "ptr") : hdc_
        data := data is Win32Handle ? NumGet(data, "ptr") : data

        result := ComCall(3, this, "ptr", hdc_, "ptr", lpht, "ptr", lpmr, "int", nHandles, "ptr", data, "int")
        return result
    }
}
