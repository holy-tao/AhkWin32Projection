#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents an application-defined callback used for being notified of lifetime changes of an object.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12lifetimeowner
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12LifetimeOwner extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12LifetimeOwner
     * @type {Guid}
     */
    static IID => Guid("{e667af9f-cd56-4f46-83ce-032e595d70a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LifetimeStateUpdated"]

    /**
     * 
     * @param {Integer} NewState 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12lifetimeowner-lifetimestateupdated
     */
    LifetimeStateUpdated(NewState) {
        ComCall(3, this, "int", NewState)
    }
}
