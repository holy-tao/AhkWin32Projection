#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IComponentConnector.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides infrastructure support for event wiring and build actions.
 * @remarks
 * IComponentConnector2 is used by the XAML compiler in generated code files. For more info, see the Remarks for [IComponentConnector](icomponentconnector.md).
 * 
 * Apps compiled by the XAML compiler for Windows 10 implement IComponentConnector2. Apps will fall back to [IComponentConnector](icomponentconnector.md) for compatibility if necessary. 
 * <!--<xref targtype="interface_winrt" rid="w_ui_xaml_mark.icomponentconnector2">IComponentConnector2</xref> includes the <xref targtype="method_winrt" rid="w_ui_xaml_mark.icomponentconnector2_getbindingconnector">GetBindingConnector</xref> method, and an additional parameter on the <xref targtype="method_winrt" rid="w_ui_xaml_mark.icomponentconnector2_connect">Connect</xref>method. These additions support compiled bindings and deferred loading of templates.-->
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.icomponentconnector2
 * @namespace Windows.UI.Xaml.Markup
 * @version WindowsRuntime 1.4
 */
class IComponentConnector2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComponentConnector2
     * @type {Guid}
     */
    static IID => Guid("{dc8f368b-eccc-498e-b139-91142254d7ae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBindingConnector"]

    /**
     * Returns the [IComponentConnector](icomponentconnector.md) for this connection.
     * @param {Integer} connectionId An identifier token to distinguish calls.
     * @param {IInspectable} target The target to connect events and names to.
     * @returns {IComponentConnector} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.icomponentconnector2.getbindingconnector
     */
    GetBindingConnector(connectionId, target) {
        result := ComCall(6, this, "int", connectionId, "ptr", target, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IComponentConnector(result_)
    }
}
