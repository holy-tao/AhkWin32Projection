#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IApoAcousticEchoCancellation.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IApoAcousticEchoCancellation2 extends IApoAcousticEchoCancellation{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApoAcousticEchoCancellation2
     * @type {Guid}
     */
    static IID => Guid("{f235855f-f06d-45b3-a63f-ee4b71509dc2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesiredReferenceStreamProperties"]

    /**
     * 
     * @param {Pointer<Integer>} pProperties 
     * @returns {HRESULT} 
     */
    GetDesiredReferenceStreamProperties(pProperties) {
        pPropertiesMarshal := pProperties is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pPropertiesMarshal, pProperties, "HRESULT")
        return result
    }
}
