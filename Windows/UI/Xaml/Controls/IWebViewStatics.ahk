#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IWebViewStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebViewStatics
     * @type {Guid}
     */
    static IID => Guid("{a0b561de-5fdb-443b-b9f0-5c30f6b7a1f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AnyScriptNotifyUri", "get_SourceProperty", "get_AllowedScriptNotifyUrisProperty", "get_DataTransferPackageProperty"]

    /**
     * @type {IVector<Uri>} 
     */
    AnyScriptNotifyUri {
        get => this.get_AnyScriptNotifyUri()
    }

    /**
     * @type {DependencyProperty} 
     */
    SourceProperty {
        get => this.get_SourceProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AllowedScriptNotifyUrisProperty {
        get => this.get_AllowedScriptNotifyUrisProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DataTransferPackageProperty {
        get => this.get_DataTransferPackageProperty()
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    get_AnyScriptNotifyUri() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Uri, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SourceProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AllowedScriptNotifyUrisProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DataTransferPackageProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
