#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IPersistSerializedPropStorage.ahk

/**
 * Exposes methods to persist serialized property storage data for later use and to restore persisted data to a new property store instance.
 * @remarks
 * 
  * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipersistserializedpropstorage">IPersistSerializedPropStorage</a> interface, from which it inherits.
  * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * <b>IPersistSerializedPropStorage2</b> is not intended for custom implementation. Use the system-provided implementation associated with the in-memory property store.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * The in-memory property store, created by calling <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-pscreatememorypropertystore">PSCreateMemoryPropertyStore</a>, provides an implementation of this interface. Use this implementation when you want to persist or restore serialized property storage data.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-ipersistserializedpropstorage2
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPersistSerializedPropStorage2 extends IPersistSerializedPropStorage{
    /**
     * The interface identifier for IPersistSerializedPropStorage2
     * @type {Guid}
     */
    static IID => Guid("{77effa68-4f98-4366-ba72-573b3d880571}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {Pointer<UInt32>} pcb 
     * @returns {HRESULT} 
     */
    GetPropertyStorageSize(pcb) {
        result := ComCall(6, this, "uint*", pcb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} psps 
     * @param {Integer} cb 
     * @param {Pointer<UInt32>} pcbWritten 
     * @returns {HRESULT} 
     */
    GetPropertyStorageBuffer(psps, cb, pcbWritten) {
        result := ComCall(7, this, "ptr", psps, "uint", cb, "uint*", pcbWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
