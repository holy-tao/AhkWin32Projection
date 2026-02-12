#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DialReceiverApp.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.DialProtocol
 * @version WindowsRuntime 1.4
 */
class IDialReceiverAppStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDialReceiverAppStatics
     * @type {Guid}
     */
    static IID => Guid("{53183a3c-4c36-4d02-b28a-f2a9da38ec52}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Current"]

    /**
     * @type {DialReceiverApp} 
     */
    Current {
        get => this.get_Current()
    }

    /**
     * 
     * @returns {DialReceiverApp} 
     */
    get_Current() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DialReceiverApp(value)
    }
}
