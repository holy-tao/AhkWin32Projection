#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method to discover objects that are named with a GUID from another object. Unlike QueryService this interface will not delegate its functionality on to other objects.
 * @remarks
 * 
  * Similar to <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678965(v=vs.85)">IServiceProvider</a>, except that this method does not imply that unhandled or unknown requests should be forwarded.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iobjectprovider
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IObjectProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectProvider
     * @type {Guid}
     */
    static IID => Guid("{a6087428-3be3-4d73-b308-7c04a540bf1a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryObject"]

    /**
     * 
     * @param {Pointer<Guid>} guidObject 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iobjectprovider-queryobject
     */
    QueryObject(guidObject, riid) {
        result := ComCall(3, this, "ptr", guidObject, "ptr", riid, "ptr*", &ppvOut := 0, "HRESULT")
        return ppvOut
    }
}
