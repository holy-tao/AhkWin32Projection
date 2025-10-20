#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDirectSound.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSound8 extends IDirectSound{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectSound8
     * @type {Guid}
     */
    static IID => Guid("{c50a7e93-f395-4834-9ef6-7fa99de50966}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["VerifyCertification"]

    /**
     * 
     * @param {Pointer<Integer>} pdwCertified 
     * @returns {HRESULT} 
     */
    VerifyCertification(pdwCertified) {
        result := ComCall(11, this, "uint*", pdwCertified, "HRESULT")
        return result
    }
}
