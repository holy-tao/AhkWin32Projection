#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods to persist serialized property storage data for later use and to restore persisted data to a new property store instance.
 * @remarks
 * 
  * Use the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface to read and write values from and to the property store.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * The in-memory property store, created by calling <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-pscreatememorypropertystore">PSCreateMemoryPropertyStore</a>, provides an implementation of this interface. Use this implementation when you want to persist or restore serialized property storage data.
  * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * <b>IPersistSerializedPropStorage</b> is not intended for custom implementation. Use the system-provided implementation associated with the in-memory property store.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-ipersistserializedpropstorage
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPersistSerializedPropStorage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPersistSerializedPropStorage
     * @type {Guid}
     */
    static IID => Guid("{e318ad57-0aa0-450f-aca5-6fab7103d917}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFlags", "SetPropertyStorage", "GetPropertyStorage"]

    /**
     * Specifies how the recognizer interprets the ink and determines the result string.Call this function before processing the ink for the first time. Therefore, call the SetFlags function before calling the Process function.
     * @param {Integer} flags 
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>HRESULT value</th>
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer does not support this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory to complete the operation.
     * 
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context is invalid or one of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-setflags
     */
    SetFlags(flags) {
        result := ComCall(3, this, "int", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} psps 
     * @param {Integer} cb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipersistserializedpropstorage-setpropertystorage
     */
    SetPropertyStorage(psps, cb) {
        result := ComCall(4, this, "ptr", psps, "uint", cb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SERIALIZEDPROPSTORAGE>>} ppsps 
     * @param {Pointer<Integer>} pcb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipersistserializedpropstorage-getpropertystorage
     */
    GetPropertyStorage(ppsps, pcb) {
        ppspsMarshal := ppsps is VarRef ? "ptr*" : "ptr"
        pcbMarshal := pcb is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, ppspsMarshal, ppsps, pcbMarshal, pcb, "HRESULT")
        return result
    }
}
