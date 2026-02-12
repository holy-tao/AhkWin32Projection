#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SearchQueryLinguisticDetails.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Search
 * @version WindowsRuntime 1.4
 */
class ISearchQueryLinguisticDetailsFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchQueryLinguisticDetailsFactory
     * @type {Guid}
     */
    static IID => Guid("{cac6c3b8-3c64-4dfd-ad9f-479e4d4065a4}")

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
     * @param {IIterable<HSTRING>} queryTextAlternatives 
     * @param {Integer} queryTextCompositionStart 
     * @param {Integer} queryTextCompositionLength 
     * @returns {SearchQueryLinguisticDetails} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(queryTextAlternatives, queryTextCompositionStart, queryTextCompositionLength) {
        result := ComCall(6, this, "ptr", queryTextAlternatives, "uint", queryTextCompositionStart, "uint", queryTextCompositionLength, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SearchQueryLinguisticDetails(value)
    }
}
