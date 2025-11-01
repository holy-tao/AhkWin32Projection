#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPartBase.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPartResourceDictionary extends IPartBase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPartResourceDictionary
     * @type {Guid}
     */
    static IID => Guid("{16cfce6d-e744-4fb3-b474-f1d54f024a01}")

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
