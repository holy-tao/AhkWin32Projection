#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Marks an interface as agile across apartments.
 * @remarks
 * 
 * The <b>IAgileObject</b> interface is a marker interface that indicates that an object is free threaded and can be called from any apartment.
 * 
 * Unlike what happens when aggregating the Free Threaded Marshaler (FTM), implementing the <b>IAgileObject</b> interface doesn't affect what happens when marshaling a call. Instead, the <b>IAgileObject</b> interface is recognized by the Global Interface Table (GIT). When an object that implements the <b>IAgileObject</b> interface is placed in the GIT and localized to another apartment, the object is called directly in the new apartment, rather than marshaling.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-iagileobject
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IAgileObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAgileObject
     * @type {Guid}
     */
    static IID => Guid("{94ea2b94-e9cc-49e0-c0ff-ee64ca8f5b90}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
