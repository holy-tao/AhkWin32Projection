#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ConnectedAnimationConfiguration.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IConnectedAnimation3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConnectedAnimation3
     * @type {Guid}
     */
    static IID => Guid("{6e3040c6-0430-59c0-a80c-cceed2e778dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Configuration", "put_Configuration"]

    /**
     * @type {ConnectedAnimationConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
        set => this.put_Configuration(value)
    }

    /**
     * 
     * @returns {ConnectedAnimationConfiguration} 
     */
    get_Configuration() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ConnectedAnimationConfiguration(value)
    }

    /**
     * 
     * @param {ConnectedAnimationConfiguration} value 
     * @returns {HRESULT} 
     */
    put_Configuration(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
