#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class IPlayReadyContentHeader2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadyContentHeader2
     * @type {Guid}
     */
    static IID => Guid("{359c79f4-2180-498c-965b-e754d875eab2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_KeyIds", "get_KeyIdStrings"]

    /**
     */
    KeyIds {
        get => this.get_KeyIds()
    }

    /**
     */
    KeyIdStrings {
        get => this.get_KeyIdStrings()
    }

    /**
     * 
     * @param {Pointer<Pointer>} contentKeyIds 
     * @returns {HRESULT} 
     */
    get_KeyIds(contentKeyIds) {
        result := ComCall(6, this, "ptr", contentKeyIds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} contentKeyIdStrings 
     * @returns {HRESULT} 
     */
    get_KeyIdStrings(contentKeyIdStrings) {
        result := ComCall(7, this, "ptr", contentKeyIdStrings, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
