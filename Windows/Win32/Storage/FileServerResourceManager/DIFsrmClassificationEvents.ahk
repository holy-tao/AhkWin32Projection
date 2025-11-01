#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Handles events that are received while processing a ClassifyFiles call.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmtlb/nn-fsrmtlb-difsrmclassificationevents
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class DIFsrmClassificationEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DIFsrmClassificationEvents
     * @type {Guid}
     */
    static IID => Guid("{26942db0-dabf-41d8-bbdd-b129a9f70424}")

    /**
     * The class identifier for DIFsrmClassificationEvents
     * @type {Guid}
     */
    static CLSID => Guid("{26942db0-dabf-41d8-bbdd-b129a9f70424}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
