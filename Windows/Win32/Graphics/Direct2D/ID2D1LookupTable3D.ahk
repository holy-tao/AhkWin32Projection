#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Resource.ahk

/**
 * A container for 3D lookup table data that can be passed to the LookupTable3D effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1lookuptable3d
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1LookupTable3D extends ID2D1Resource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1LookupTable3D
     * @type {Guid}
     */
    static IID => Guid("{53dd9855-a3b0-4d5b-82e1-26e25c5e5797}")

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
