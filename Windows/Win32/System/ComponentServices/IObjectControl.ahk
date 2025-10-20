#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Defines context-specific initialization and cleanup procedures for your COM+ objects, and specifies whether the objects can be recycled.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iobjectcontrol
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IObjectControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectControl
     * @type {Guid}
     */
    static IID => Guid("{51372aec-cae7-11cf-be81-00aa00a2fa25}")

    /**
     * The class identifier for ObjectControl
     * @type {Guid}
     */
    static CLSID => Guid("{7dc41850-0c31-11d0-8b79-00aa00b8a790}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Activate", "Deactivate", "CanBePooled"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontrol-activate
     */
    Activate() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontrol-deactivate
     */
    Deactivate() {
        ComCall(4, this)
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontrol-canbepooled
     */
    CanBePooled() {
        result := ComCall(5, this, "int")
        return result
    }
}
