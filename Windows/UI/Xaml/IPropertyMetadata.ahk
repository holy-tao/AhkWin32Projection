#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CreateDefaultValueCallback.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IPropertyMetadata extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyMetadata
     * @type {Guid}
     */
    static IID => Guid("{814ef30d-8d18-448a-8644-f2cb51e70380}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DefaultValue", "get_CreateDefaultValueCallback"]

    /**
     * @type {IInspectable} 
     */
    DefaultValue {
        get => this.get_DefaultValue()
    }

    /**
     * @type {CreateDefaultValueCallback} 
     */
    CreateDefaultValueCallback {
        get => this.get_CreateDefaultValueCallback()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_DefaultValue() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @returns {CreateDefaultValueCallback} 
     */
    get_CreateDefaultValueCallback() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CreateDefaultValueCallback(value)
    }
}
