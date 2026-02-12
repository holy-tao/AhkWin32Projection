#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ItemIndexRange.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class IItemIndexRangeFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IItemIndexRangeFactory
     * @type {Guid}
     */
    static IID => Guid("{86e2c440-2e7a-4c7d-a664-e8abf07bfc7e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {Integer} firstIndex 
     * @param {Integer} length 
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {ItemIndexRange} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(firstIndex, length, baseInterface, innerInterface) {
        result := ComCall(6, this, "int", firstIndex, "uint", length, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ItemIndexRange(value)
    }
}
