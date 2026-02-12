#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.AppService
 * @version WindowsRuntime 1.4
 */
class IAppServiceTriggerDetails2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppServiceTriggerDetails2
     * @type {Guid}
     */
    static IID => Guid("{e83d54b2-28cc-43f2-b465-c0482e59e2dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsRemoteSystemConnection"]

    /**
     * @type {Boolean} 
     */
    IsRemoteSystemConnection {
        get => this.get_IsRemoteSystemConnection()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRemoteSystemConnection() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
