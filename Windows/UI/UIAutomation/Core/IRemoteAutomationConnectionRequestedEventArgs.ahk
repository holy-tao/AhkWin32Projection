#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.UIAutomation.Core
 * @version WindowsRuntime 1.4
 */
class IRemoteAutomationConnectionRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteAutomationConnectionRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{ea3319a8-e3a8-5dc6-adf8-044e46b14af5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LocalPipeName", "get_RemoteProcessId"]

    /**
     * @type {HSTRING} 
     */
    LocalPipeName {
        get => this.get_LocalPipeName()
    }

    /**
     * @type {Integer} 
     */
    RemoteProcessId {
        get => this.get_RemoteProcessId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LocalPipeName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RemoteProcessId() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
