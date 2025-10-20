#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IApoAcousticEchoCancellation.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IApoAcousticEchoCancellation2 extends IApoAcousticEchoCancellation{
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
     * 
     * @param {Pointer<Int32>} pProperties 
     * @returns {HRESULT} 
     */
    GetDesiredReferenceStreamProperties(pProperties) {
        result := ComCall(3, this, "int*", pProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
