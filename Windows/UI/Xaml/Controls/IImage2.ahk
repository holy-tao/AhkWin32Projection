#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Media\Casting\CastingSource.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IImage2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImage2
     * @type {Guid}
     */
    static IID => Guid("{f445119e-881f-48bb-873a-64417ca4f002}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAsCastingSource"]

    /**
     * 
     * @returns {CastingSource} 
     */
    GetAsCastingSource() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CastingSource(result_)
    }
}
