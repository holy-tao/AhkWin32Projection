#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class ITypographyStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITypographyStatics
     * @type {Guid}
     */
    static IID => Guid("{67b9ec88-6c57-4ce0-95f1-d4b9ed632fb4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AnnotationAlternatesProperty", "GetAnnotationAlternates", "SetAnnotationAlternates", "get_EastAsianExpertFormsProperty", "GetEastAsianExpertForms", "SetEastAsianExpertForms", "get_EastAsianLanguageProperty", "GetEastAsianLanguage", "SetEastAsianLanguage", "get_EastAsianWidthsProperty", "GetEastAsianWidths", "SetEastAsianWidths", "get_StandardLigaturesProperty", "GetStandardLigatures", "SetStandardLigatures", "get_ContextualLigaturesProperty", "GetContextualLigatures", "SetContextualLigatures", "get_DiscretionaryLigaturesProperty", "GetDiscretionaryLigatures", "SetDiscretionaryLigatures", "get_HistoricalLigaturesProperty", "GetHistoricalLigatures", "SetHistoricalLigatures", "get_StandardSwashesProperty", "GetStandardSwashes", "SetStandardSwashes", "get_ContextualSwashesProperty", "GetContextualSwashes", "SetContextualSwashes", "get_ContextualAlternatesProperty", "GetContextualAlternates", "SetContextualAlternates", "get_StylisticAlternatesProperty", "GetStylisticAlternates", "SetStylisticAlternates", "get_StylisticSet1Property", "GetStylisticSet1", "SetStylisticSet1", "get_StylisticSet2Property", "GetStylisticSet2", "SetStylisticSet2", "get_StylisticSet3Property", "GetStylisticSet3", "SetStylisticSet3", "get_StylisticSet4Property", "GetStylisticSet4", "SetStylisticSet4", "get_StylisticSet5Property", "GetStylisticSet5", "SetStylisticSet5", "get_StylisticSet6Property", "GetStylisticSet6", "SetStylisticSet6", "get_StylisticSet7Property", "GetStylisticSet7", "SetStylisticSet7", "get_StylisticSet8Property", "GetStylisticSet8", "SetStylisticSet8", "get_StylisticSet9Property", "GetStylisticSet9", "SetStylisticSet9", "get_StylisticSet10Property", "GetStylisticSet10", "SetStylisticSet10", "get_StylisticSet11Property", "GetStylisticSet11", "SetStylisticSet11", "get_StylisticSet12Property", "GetStylisticSet12", "SetStylisticSet12", "get_StylisticSet13Property", "GetStylisticSet13", "SetStylisticSet13", "get_StylisticSet14Property", "GetStylisticSet14", "SetStylisticSet14", "get_StylisticSet15Property", "GetStylisticSet15", "SetStylisticSet15", "get_StylisticSet16Property", "GetStylisticSet16", "SetStylisticSet16", "get_StylisticSet17Property", "GetStylisticSet17", "SetStylisticSet17", "get_StylisticSet18Property", "GetStylisticSet18", "SetStylisticSet18", "get_StylisticSet19Property", "GetStylisticSet19", "SetStylisticSet19", "get_StylisticSet20Property", "GetStylisticSet20", "SetStylisticSet20", "get_CapitalsProperty", "GetCapitals", "SetCapitals", "get_CapitalSpacingProperty", "GetCapitalSpacing", "SetCapitalSpacing", "get_KerningProperty", "GetKerning", "SetKerning", "get_CaseSensitiveFormsProperty", "GetCaseSensitiveForms", "SetCaseSensitiveForms", "get_HistoricalFormsProperty", "GetHistoricalForms", "SetHistoricalForms", "get_FractionProperty", "GetFraction", "SetFraction", "get_NumeralStyleProperty", "GetNumeralStyle", "SetNumeralStyle", "get_NumeralAlignmentProperty", "GetNumeralAlignment", "SetNumeralAlignment", "get_SlashedZeroProperty", "GetSlashedZero", "SetSlashedZero", "get_MathematicalGreekProperty", "GetMathematicalGreek", "SetMathematicalGreek", "get_VariantsProperty", "GetVariants", "SetVariants"]

    /**
     * @type {DependencyProperty} 
     */
    AnnotationAlternatesProperty {
        get => this.get_AnnotationAlternatesProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    EastAsianExpertFormsProperty {
        get => this.get_EastAsianExpertFormsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    EastAsianLanguageProperty {
        get => this.get_EastAsianLanguageProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    EastAsianWidthsProperty {
        get => this.get_EastAsianWidthsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    StandardLigaturesProperty {
        get => this.get_StandardLigaturesProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ContextualLigaturesProperty {
        get => this.get_ContextualLigaturesProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DiscretionaryLigaturesProperty {
        get => this.get_DiscretionaryLigaturesProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HistoricalLigaturesProperty {
        get => this.get_HistoricalLigaturesProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    StandardSwashesProperty {
        get => this.get_StandardSwashesProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ContextualSwashesProperty {
        get => this.get_ContextualSwashesProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ContextualAlternatesProperty {
        get => this.get_ContextualAlternatesProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    StylisticAlternatesProperty {
        get => this.get_StylisticAlternatesProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    StylisticSet1Property {
        get => this.get_StylisticSet1Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    StylisticSet2Property {
        get => this.get_StylisticSet2Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    StylisticSet3Property {
        get => this.get_StylisticSet3Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    StylisticSet4Property {
        get => this.get_StylisticSet4Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    StylisticSet5Property {
        get => this.get_StylisticSet5Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    StylisticSet6Property {
        get => this.get_StylisticSet6Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    StylisticSet7Property {
        get => this.get_StylisticSet7Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    StylisticSet8Property {
        get => this.get_StylisticSet8Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    StylisticSet9Property {
        get => this.get_StylisticSet9Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    StylisticSet10Property {
        get => this.get_StylisticSet10Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    StylisticSet11Property {
        get => this.get_StylisticSet11Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    StylisticSet12Property {
        get => this.get_StylisticSet12Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    StylisticSet13Property {
        get => this.get_StylisticSet13Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    StylisticSet14Property {
        get => this.get_StylisticSet14Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    StylisticSet15Property {
        get => this.get_StylisticSet15Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    StylisticSet16Property {
        get => this.get_StylisticSet16Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    StylisticSet17Property {
        get => this.get_StylisticSet17Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    StylisticSet18Property {
        get => this.get_StylisticSet18Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    StylisticSet19Property {
        get => this.get_StylisticSet19Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    StylisticSet20Property {
        get => this.get_StylisticSet20Property()
    }

    /**
     * @type {DependencyProperty} 
     */
    CapitalsProperty {
        get => this.get_CapitalsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CapitalSpacingProperty {
        get => this.get_CapitalSpacingProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    KerningProperty {
        get => this.get_KerningProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CaseSensitiveFormsProperty {
        get => this.get_CaseSensitiveFormsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HistoricalFormsProperty {
        get => this.get_HistoricalFormsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FractionProperty {
        get => this.get_FractionProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    NumeralStyleProperty {
        get => this.get_NumeralStyleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    NumeralAlignmentProperty {
        get => this.get_NumeralAlignmentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SlashedZeroProperty {
        get => this.get_SlashedZeroProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MathematicalGreekProperty {
        get => this.get_MathematicalGreekProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VariantsProperty {
        get => this.get_VariantsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AnnotationAlternatesProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Integer} 
     */
    GetAnnotationAlternates(element) {
        result := ComCall(7, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetAnnotationAlternates(element, value) {
        result := ComCall(8, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_EastAsianExpertFormsProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetEastAsianExpertForms(element) {
        result := ComCall(10, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetEastAsianExpertForms(element, value) {
        result := ComCall(11, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_EastAsianLanguageProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Integer} 
     */
    GetEastAsianLanguage(element) {
        result := ComCall(13, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetEastAsianLanguage(element, value) {
        result := ComCall(14, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_EastAsianWidthsProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Integer} 
     */
    GetEastAsianWidths(element) {
        result := ComCall(16, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetEastAsianWidths(element, value) {
        result := ComCall(17, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StandardLigaturesProperty() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetStandardLigatures(element) {
        result := ComCall(19, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetStandardLigatures(element, value) {
        result := ComCall(20, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ContextualLigaturesProperty() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetContextualLigatures(element) {
        result := ComCall(22, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetContextualLigatures(element, value) {
        result := ComCall(23, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DiscretionaryLigaturesProperty() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetDiscretionaryLigatures(element) {
        result := ComCall(25, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetDiscretionaryLigatures(element, value) {
        result := ComCall(26, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HistoricalLigaturesProperty() {
        result := ComCall(27, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetHistoricalLigatures(element) {
        result := ComCall(28, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetHistoricalLigatures(element, value) {
        result := ComCall(29, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StandardSwashesProperty() {
        result := ComCall(30, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Integer} 
     */
    GetStandardSwashes(element) {
        result := ComCall(31, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetStandardSwashes(element, value) {
        result := ComCall(32, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ContextualSwashesProperty() {
        result := ComCall(33, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Integer} 
     */
    GetContextualSwashes(element) {
        result := ComCall(34, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetContextualSwashes(element, value) {
        result := ComCall(35, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ContextualAlternatesProperty() {
        result := ComCall(36, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetContextualAlternates(element) {
        result := ComCall(37, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetContextualAlternates(element, value) {
        result := ComCall(38, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StylisticAlternatesProperty() {
        result := ComCall(39, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Integer} 
     */
    GetStylisticAlternates(element) {
        result := ComCall(40, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetStylisticAlternates(element, value) {
        result := ComCall(41, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StylisticSet1Property() {
        result := ComCall(42, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetStylisticSet1(element) {
        result := ComCall(43, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetStylisticSet1(element, value) {
        result := ComCall(44, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StylisticSet2Property() {
        result := ComCall(45, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetStylisticSet2(element) {
        result := ComCall(46, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetStylisticSet2(element, value) {
        result := ComCall(47, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StylisticSet3Property() {
        result := ComCall(48, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetStylisticSet3(element) {
        result := ComCall(49, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetStylisticSet3(element, value) {
        result := ComCall(50, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StylisticSet4Property() {
        result := ComCall(51, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetStylisticSet4(element) {
        result := ComCall(52, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetStylisticSet4(element, value) {
        result := ComCall(53, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StylisticSet5Property() {
        result := ComCall(54, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetStylisticSet5(element) {
        result := ComCall(55, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetStylisticSet5(element, value) {
        result := ComCall(56, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StylisticSet6Property() {
        result := ComCall(57, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetStylisticSet6(element) {
        result := ComCall(58, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetStylisticSet6(element, value) {
        result := ComCall(59, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StylisticSet7Property() {
        result := ComCall(60, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetStylisticSet7(element) {
        result := ComCall(61, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetStylisticSet7(element, value) {
        result := ComCall(62, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StylisticSet8Property() {
        result := ComCall(63, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetStylisticSet8(element) {
        result := ComCall(64, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetStylisticSet8(element, value) {
        result := ComCall(65, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StylisticSet9Property() {
        result := ComCall(66, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetStylisticSet9(element) {
        result := ComCall(67, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetStylisticSet9(element, value) {
        result := ComCall(68, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StylisticSet10Property() {
        result := ComCall(69, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetStylisticSet10(element) {
        result := ComCall(70, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetStylisticSet10(element, value) {
        result := ComCall(71, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StylisticSet11Property() {
        result := ComCall(72, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetStylisticSet11(element) {
        result := ComCall(73, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetStylisticSet11(element, value) {
        result := ComCall(74, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StylisticSet12Property() {
        result := ComCall(75, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetStylisticSet12(element) {
        result := ComCall(76, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetStylisticSet12(element, value) {
        result := ComCall(77, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StylisticSet13Property() {
        result := ComCall(78, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetStylisticSet13(element) {
        result := ComCall(79, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetStylisticSet13(element, value) {
        result := ComCall(80, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StylisticSet14Property() {
        result := ComCall(81, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetStylisticSet14(element) {
        result := ComCall(82, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetStylisticSet14(element, value) {
        result := ComCall(83, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StylisticSet15Property() {
        result := ComCall(84, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetStylisticSet15(element) {
        result := ComCall(85, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetStylisticSet15(element, value) {
        result := ComCall(86, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StylisticSet16Property() {
        result := ComCall(87, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetStylisticSet16(element) {
        result := ComCall(88, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetStylisticSet16(element, value) {
        result := ComCall(89, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StylisticSet17Property() {
        result := ComCall(90, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetStylisticSet17(element) {
        result := ComCall(91, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetStylisticSet17(element, value) {
        result := ComCall(92, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StylisticSet18Property() {
        result := ComCall(93, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetStylisticSet18(element) {
        result := ComCall(94, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetStylisticSet18(element, value) {
        result := ComCall(95, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StylisticSet19Property() {
        result := ComCall(96, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetStylisticSet19(element) {
        result := ComCall(97, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetStylisticSet19(element, value) {
        result := ComCall(98, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StylisticSet20Property() {
        result := ComCall(99, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetStylisticSet20(element) {
        result := ComCall(100, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetStylisticSet20(element, value) {
        result := ComCall(101, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CapitalsProperty() {
        result := ComCall(102, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Integer} 
     */
    GetCapitals(element) {
        result := ComCall(103, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetCapitals(element, value) {
        result := ComCall(104, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CapitalSpacingProperty() {
        result := ComCall(105, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetCapitalSpacing(element) {
        result := ComCall(106, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetCapitalSpacing(element, value) {
        result := ComCall(107, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_KerningProperty() {
        result := ComCall(108, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * The GetKerningPairs function retrieves the character-kerning pairs for the currently selected font for the specified device context. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The wingdi.h header defines GetKerningPairs as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-getkerningpairsw
     */
    GetKerning(element) {
        result := ComCall(109, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetKerning(element, value) {
        result := ComCall(110, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CaseSensitiveFormsProperty() {
        result := ComCall(111, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetCaseSensitiveForms(element) {
        result := ComCall(112, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetCaseSensitiveForms(element, value) {
        result := ComCall(113, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HistoricalFormsProperty() {
        result := ComCall(114, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetHistoricalForms(element) {
        result := ComCall(115, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetHistoricalForms(element, value) {
        result := ComCall(116, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FractionProperty() {
        result := ComCall(117, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Integer} 
     */
    GetFraction(element) {
        result := ComCall(118, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetFraction(element, value) {
        result := ComCall(119, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_NumeralStyleProperty() {
        result := ComCall(120, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Integer} 
     */
    GetNumeralStyle(element) {
        result := ComCall(121, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetNumeralStyle(element, value) {
        result := ComCall(122, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_NumeralAlignmentProperty() {
        result := ComCall(123, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Integer} 
     */
    GetNumeralAlignment(element) {
        result := ComCall(124, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetNumeralAlignment(element, value) {
        result := ComCall(125, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SlashedZeroProperty() {
        result := ComCall(126, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetSlashedZero(element) {
        result := ComCall(127, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetSlashedZero(element, value) {
        result := ComCall(128, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MathematicalGreekProperty() {
        result := ComCall(129, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Boolean} 
     */
    GetMathematicalGreek(element) {
        result := ComCall(130, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetMathematicalGreek(element, value) {
        result := ComCall(131, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_VariantsProperty() {
        result := ComCall(132, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Integer} 
     */
    GetVariants(element) {
        result := ComCall(133, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetVariants(element, value) {
        result := ComCall(134, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
