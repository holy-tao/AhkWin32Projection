#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\User.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.UserProfile
 * @version WindowsRuntime 1.4
 */
class IGlobalizationPreferencesForUser extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGlobalizationPreferencesForUser
     * @type {Guid}
     */
    static IID => Guid("{150f0795-4f6e-40ba-a010-e27d81bda7f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_User", "get_Calendars", "get_Clocks", "get_Currencies", "get_Languages", "get_HomeGeographicRegion", "get_WeekStartsOn"]

    /**
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    Calendars {
        get => this.get_Calendars()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    Clocks {
        get => this.get_Clocks()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    Currencies {
        get => this.get_Currencies()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    Languages {
        get => this.get_Languages()
    }

    /**
     * @type {HSTRING} 
     */
    HomeGeographicRegion {
        get => this.get_HomeGeographicRegion()
    }

    /**
     * @type {Integer} 
     */
    WeekStartsOn {
        get => this.get_WeekStartsOn()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return User(value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Calendars() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Clocks() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Currencies() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Languages() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HomeGeographicRegion() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WeekStartsOn() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
