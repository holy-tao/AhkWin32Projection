#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Sets a property on an effect.
 * @remarks
 * Supply a <b>PD2D1_PROPERTY_SET_FUNCTION</b> function pointer to the <b>setFunction</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_property_binding">D2D1_PROPERTY_BINDING</a> structure to specify the function that Direct2D uses to set data for a property.
 * @see https://learn.microsoft.com/windows/win32/api//content/d2d1effectauthor/nc-d2d1effectauthor-pd2d1_property_set_function
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class PD2D1_PROPERTY_SET_FUNCTION extends IUnknown {

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
     * @param {IUnknown} effect_ 
     * @param {Pointer<Integer>} data 
     * @param {Integer} dataSize 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(effect_, data, dataSize) {
        dataMarshal := data is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", effect_, dataMarshal, data, "uint", dataSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
