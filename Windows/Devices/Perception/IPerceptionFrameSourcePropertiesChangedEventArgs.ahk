#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class IPerceptionFrameSourcePropertiesChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionFrameSourcePropertiesChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{6c68e068-bcf1-4ecc-b891-7625d1244b6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CollectionChange", "get_Key"]

    /**
     * @type {Integer} 
     */
    CollectionChange {
        get => this.get_CollectionChange()
    }

    /**
     * @type {HSTRING} 
     */
    Key {
        get => this.get_Key()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CollectionChange() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Key() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
