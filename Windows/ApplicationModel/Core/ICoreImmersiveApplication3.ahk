#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CoreApplicationView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Core
 * @version WindowsRuntime 1.4
 */
class ICoreImmersiveApplication3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreImmersiveApplication3
     * @type {Guid}
     */
    static IID => Guid("{34a05b2f-ee0d-41e5-8314-cf10c91bf0af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateNewViewWithViewSource"]

    /**
     * 
     * @param {IFrameworkViewSource} viewSource 
     * @returns {CoreApplicationView} 
     */
    CreateNewViewWithViewSource(viewSource) {
        result := ComCall(6, this, "ptr", viewSource, "ptr*", &view_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreApplicationView(view_)
    }
}
