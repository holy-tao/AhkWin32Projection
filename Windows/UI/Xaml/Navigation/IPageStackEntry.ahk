#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Interop\TypeName.ahk
#Include ..\Media\Animation\NavigationTransitionInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Navigation
 * @version WindowsRuntime 1.4
 */
class IPageStackEntry extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPageStackEntry
     * @type {Guid}
     */
    static IID => Guid("{ef8814a6-9388-4aca-8572-405194069080}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourcePageType", "get_Parameter", "get_NavigationTransitionInfo"]

    /**
     * @type {TypeName} 
     */
    SourcePageType {
        get => this.get_SourcePageType()
    }

    /**
     * @type {IInspectable} 
     */
    Parameter {
        get => this.get_Parameter()
    }

    /**
     * @type {NavigationTransitionInfo} 
     */
    NavigationTransitionInfo {
        get => this.get_NavigationTransitionInfo()
    }

    /**
     * 
     * @returns {TypeName} 
     */
    get_SourcePageType() {
        value := TypeName()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Parameter() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @returns {NavigationTransitionInfo} 
     */
    get_NavigationTransitionInfo() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NavigationTransitionInfo(value)
    }
}
