#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Marks an object that doesn't support being marshaled or stored in the Global Interface Table.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-inomarshal
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class INoMarshal extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INoMarshal
     * @type {Guid}
     */
    static IID => Guid("{ecc8691b-c1db-4dc0-855e-65f6c551af49}")

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
