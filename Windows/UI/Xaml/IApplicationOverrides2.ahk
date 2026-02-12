#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IApplicationOverrides2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationOverrides2
     * @type {Guid}
     */
    static IID => Guid("{db5cd2b9-d3b4-558c-c64e-0434fd1bd889}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnBackgroundActivated"]

    /**
     * 
     * @param {BackgroundActivatedEventArgs} args 
     * @returns {HRESULT} 
     */
    OnBackgroundActivated(args) {
        result := ComCall(6, this, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
