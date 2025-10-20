#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Resource.ahk

/**
 * Encapsulates a device- and transform-dependent representation of a filled or stroked geometry.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_2/nn-d2d1_2-id2d1geometryrealization
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1GeometryRealization extends ID2D1Resource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1GeometryRealization
     * @type {Guid}
     */
    static IID => Guid("{a16907d7-bc02-4801-99e8-8cf7f485f774}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
