#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.PushNotifications
 * @version WindowsRuntime 1.4
 */
class IRawNotification3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRawNotification3
     * @type {Guid}
     */
    static IID => Guid("{62737dde-8a73-424c-ab44-5635f40a96e5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContentBytes"]

    /**
     * @type {IBuffer} 
     */
    ContentBytes {
        get => this.get_ContentBytes()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_ContentBytes() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }
}
