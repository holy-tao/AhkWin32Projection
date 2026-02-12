#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionVirtualDrawingSurface extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionVirtualDrawingSurface
     * @type {Guid}
     */
    static IID => Guid("{a9c384db-8740-4f94-8b9d-b68521e7863d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Trim"]

    /**
     * 
     * @param {Integer} rects_length 
     * @param {Pointer<RectInt32>} rects 
     * @returns {HRESULT} 
     */
    Trim(rects_length, rects) {
        result := ComCall(6, this, "uint", rects_length, "ptr", rects, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
