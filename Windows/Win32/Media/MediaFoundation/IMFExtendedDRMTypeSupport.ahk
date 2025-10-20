#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFExtendedDRMTypeSupport extends IUnknown{
    /**
     * The interface identifier for IMFExtendedDRMTypeSupport
     * @type {Guid}
     */
    static IID => Guid("{332ec562-3758-468d-a784-e38f23552128}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BSTR} type 
     * @param {BSTR} keySystem 
     * @param {Pointer<Int32>} pAnswer 
     * @returns {HRESULT} 
     */
    IsTypeSupportedEx(type, keySystem, pAnswer) {
        type := type is String ? BSTR.Alloc(type).Value : type
        keySystem := keySystem is String ? BSTR.Alloc(keySystem).Value : keySystem

        result := ComCall(3, this, "ptr", type, "ptr", keySystem, "int*", pAnswer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
