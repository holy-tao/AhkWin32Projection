#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.UserProfile
 * @version WindowsRuntime 1.4
 */
class IAdvertisingManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdvertisingManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{add3468c-a273-48cb-b346-3544522d5581}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AdvertisingId"]

    /**
     * @type {HSTRING} 
     */
    AdvertisingId {
        get => this.get_AdvertisingId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AdvertisingId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
