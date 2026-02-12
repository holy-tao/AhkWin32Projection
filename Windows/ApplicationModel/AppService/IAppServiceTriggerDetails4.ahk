#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.AppService
 * @version WindowsRuntime 1.4
 */
class IAppServiceTriggerDetails4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppServiceTriggerDetails4
     * @type {Guid}
     */
    static IID => Guid("{1185b180-8861-5e30-ab55-1cf4d08bbf6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CallerRemoteConnectionToken"]

    /**
     * @type {HSTRING} 
     */
    CallerRemoteConnectionToken {
        get => this.get_CallerRemoteConnectionToken()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CallerRemoteConnectionToken() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
