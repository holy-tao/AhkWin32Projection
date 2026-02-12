#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IMap.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class ITargetedContentSubscriptionOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITargetedContentSubscriptionOptions
     * @type {Guid}
     */
    static IID => Guid("{61ee6ad0-2c83-421b-8467-413eaf1aeb97}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SubscriptionId", "get_AllowPartialContentAvailability", "put_AllowPartialContentAvailability", "get_CloudQueryParameters", "get_LocalFilters", "Update"]

    /**
     * @type {HSTRING} 
     */
    SubscriptionId {
        get => this.get_SubscriptionId()
    }

    /**
     * @type {Boolean} 
     */
    AllowPartialContentAvailability {
        get => this.get_AllowPartialContentAvailability()
        set => this.put_AllowPartialContentAvailability(value)
    }

    /**
     * @type {IMap<HSTRING, HSTRING>} 
     */
    CloudQueryParameters {
        get => this.get_CloudQueryParameters()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    LocalFilters {
        get => this.get_LocalFilters()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SubscriptionId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowPartialContentAvailability() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowPartialContentAvailability(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_CloudQueryParameters() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_LocalFilters() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * Learn more about: Update constructor
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/extensible-storage-engine/update-constructor
     */
    Update() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
