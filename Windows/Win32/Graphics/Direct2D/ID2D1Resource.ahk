#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a Direct2D drawing resource.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1resource
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Resource extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Resource
     * @type {Guid}
     */
    static IID => Guid("{2cd90691-12e2-11dc-9fed-001143a055f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFactory"]

    /**
     * Retrieves the factory associated with this resource.
     * @param {Pointer<ID2D1Factory>} factory Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1factory">ID2D1Factory</a>**</b>
     * 
     * When this method returns, contains a pointer to a pointer to the factory that created this resource. This parameter is passed uninitialized.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1/nf-d2d1-id2d1resource-getfactory
     */
    GetFactory(factory) {
        ComCall(3, this, "ptr*", factory)
    }
}
