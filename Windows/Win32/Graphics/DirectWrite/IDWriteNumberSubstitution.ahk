#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Holds the appropriate digits and numeric punctuation for a specified locale.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritenumbersubstitution
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteNumberSubstitution extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteNumberSubstitution
     * @type {Guid}
     */
    static IID => Guid("{14885cc9-bab0-4f90-b6ed-5c366a2cd03d}")

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
