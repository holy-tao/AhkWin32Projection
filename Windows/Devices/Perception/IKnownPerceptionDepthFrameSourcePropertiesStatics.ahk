#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class IKnownPerceptionDepthFrameSourcePropertiesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownPerceptionDepthFrameSourcePropertiesStatics
     * @type {Guid}
     */
    static IID => Guid("{5df1cca2-01f8-4a87-b859-d5e5b7e1de4a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MinDepth", "get_MaxDepth"]

    /**
     * @type {HSTRING} 
     */
    MinDepth {
        get => this.get_MinDepth()
    }

    /**
     * @type {HSTRING} 
     */
    MaxDepth {
        get => this.get_MaxDepth()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MinDepth() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MaxDepth() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
