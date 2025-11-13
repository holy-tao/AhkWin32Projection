#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ISupportActivationFromPackage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISupportActivationFromPackage
     * @type {Guid}
     */
    static IID => Guid("{0a18aae5-5caa-48c5-a9f4-6e46dcd58ad5}")

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
