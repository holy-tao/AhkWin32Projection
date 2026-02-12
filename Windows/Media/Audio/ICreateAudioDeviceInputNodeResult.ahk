#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AudioDeviceInputNode.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class ICreateAudioDeviceInputNodeResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICreateAudioDeviceInputNodeResult
     * @type {Guid}
     */
    static IID => Guid("{16eec7a8-1ca7-40ef-91a4-d346e0aa1bba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_DeviceInputNode"]

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {AudioDeviceInputNode} 
     */
    DeviceInputNode {
        get => this.get_DeviceInputNode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {AudioDeviceInputNode} 
     */
    get_DeviceInputNode() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioDeviceInputNode(value)
    }
}
