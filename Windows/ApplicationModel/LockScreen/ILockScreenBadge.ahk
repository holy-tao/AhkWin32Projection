#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IRandomAccessStream.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.LockScreen
 * @version WindowsRuntime 1.4
 */
class ILockScreenBadge extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILockScreenBadge
     * @type {Guid}
     */
    static IID => Guid("{e95105d9-2bff-4db0-9b4f-3824778b9c9a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Logo", "get_Glyph", "get_Number", "get_AutomationName", "LaunchApp"]

    /**
     * @type {IRandomAccessStream} 
     */
    Logo {
        get => this.get_Logo()
    }

    /**
     * @type {IRandomAccessStream} 
     */
    Glyph {
        get => this.get_Glyph()
    }

    /**
     * @type {IReference<Integer>} 
     */
    Number {
        get => this.get_Number()
    }

    /**
     * @type {HSTRING} 
     */
    AutomationName {
        get => this.get_AutomationName()
    }

    /**
     * 
     * @returns {IRandomAccessStream} 
     */
    get_Logo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStream(value)
    }

    /**
     * 
     * @returns {IRandomAccessStream} 
     */
    get_Glyph() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStream(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Number() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AutomationName() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    LaunchApp() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
