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
     * Toggles the property store object between the read-only and read/write state.
     * @param {Integer} flags Type: <b>PERSIST_SPROPSTORE_FLAGS</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipersistserializedpropstorage-setflags
     */
    SetFlags(flags) {
        result := ComCall(3, this, "int", flags, "HRESULT")
        return result
    }

    /**
     * Initializes the property store instance from the specified serialized property storage data.
     * @param {Pointer} psps Type: <b>PCUSERIALIZEDPROPSTORAGE</b>
     * 
     * A pointer to the serialized property store data that will be used to initialize the property store.
     * @param {Integer} cb Type: <b>DWORD</b>
     * 
     * The count of bytes contained in the serialized property storage data pointed to by <i>psps</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipersistserializedpropstorage-setpropertystorage
     */
    SetPropertyStorage(psps, cb) {
        result := ComCall(4, this, "ptr", psps, "uint", cb, "HRESULT")
        return result
    }

    /**
     * Gets the serialized property storage data from the property store instance.
     * @param {Pointer<Pointer<SERIALIZEDPROPSTORAGE>>} ppsps Type: <b>SERIALIZEDPROPSTORAGE**</b>
     * 
     * When this method returns, contains the address of a pointer to the serialized property storage data.
     * @param {Pointer<Integer>} pcb Type: <b>DWORD*</b>
     * 
     * When this method returns, contains the count of bytes contained in the serialized property storage data pointed to by <i>ppsps</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipersistserializedpropstorage-getpropertystorage
     */
    GetPropertyStorage(ppsps, pcb) {
        ppspsMarshal := ppsps is VarRef ? "ptr*" : "ptr"
        pcbMarshal := pcb is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, ppspsMarshal, ppsps, pcbMarshal, pcb, "HRESULT")
        return result
    }
}
