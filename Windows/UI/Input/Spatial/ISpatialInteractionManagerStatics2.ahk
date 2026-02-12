#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialInteractionManagerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialInteractionManagerStatics2
     * @type {Guid}
     */
    static IID => Guid("{93f16c52-b88a-5929-8d7c-48cb948b081c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsSourceKindSupported"]

    /**
     * 
     * @param {Integer} kind 
     * @returns {Boolean} 
     */
    IsSourceKindSupported(kind) {
        result := ComCall(6, this, "int", kind, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
