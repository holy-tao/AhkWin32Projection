#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class DomConstructor{

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorObject => 0

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorAttr => 1

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorBehaviorUrnsCollection => 2

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorBookmarkCollection => 3

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorCompatibleInfo => 4

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorCompatibleInfoCollection => 5

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorControlRangeCollection => 6

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorCSSCurrentStyleDeclaration => 7

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorCSSRuleList => 8

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorCSSRuleStyleDeclaration => 9

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorCSSStyleDeclaration => 10

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorCSSStyleRule => 11

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorCSSStyleSheet => 12

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorDataTransfer => 13

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorDOMImplementation => 14

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorElement => 15

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorEvent => 16

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHistory => 17

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTCElementBehaviorDefaults => 18

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLAnchorElement => 19

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLAreaElement => 20

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLAreasCollection => 21

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLBaseElement => 22

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLBaseFontElement => 23

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLBGSoundElement => 24

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLBlockElement => 25

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLBodyElement => 26

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLBRElement => 27

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLButtonElement => 28

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLCollection => 29

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLCommentElement => 30

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLDDElement => 31

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLDivElement => 32

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLDocument => 33

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLDListElement => 34

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLDTElement => 35

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLEmbedElement => 36

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLFieldSetElement => 37

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLFontElement => 38

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLFormElement => 39

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLFrameElement => 40

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLFrameSetElement => 41

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLGenericElement => 42

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLHeadElement => 43

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLHeadingElement => 44

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLHRElement => 45

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLHtmlElement => 46

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLIFrameElement => 47

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLImageElement => 48

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLInputElement => 49

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLIsIndexElement => 50

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLLabelElement => 51

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLLegendElement => 52

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLLIElement => 53

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLLinkElement => 54

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLMapElement => 55

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLMarqueeElement => 56

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLMetaElement => 57

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLModelessDialog => 58

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLNamespaceInfo => 59

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLNamespaceInfoCollection => 60

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLNextIdElement => 61

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLNoShowElement => 62

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLObjectElement => 63

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLOListElement => 64

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLOptionElement => 65

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLParagraphElement => 66

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLParamElement => 67

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLPhraseElement => 68

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLPluginsCollection => 69

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLPopup => 70

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLScriptElement => 71

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLSelectElement => 72

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLSpanElement => 73

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLStyleElement => 74

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLTableCaptionElement => 75

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLTableCellElement => 76

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLTableColElement => 77

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLTableElement => 78

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLTableRowElement => 79

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLTableSectionElement => 80

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLTextAreaElement => 81

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLTextElement => 82

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLTitleElement => 83

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLUListElement => 84

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorHTMLUnknownElement => 85

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorImage => 86

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorLocation => 87

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorNamedNodeMap => 88

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorNavigator => 89

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorNodeList => 90

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorOption => 91

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorScreen => 92

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorSelection => 93

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorStaticNodeList => 94

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorStorage => 95

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorStyleSheetList => 96

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorStyleSheetPage => 97

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorStyleSheetPageList => 98

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorText => 99

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorTextRange => 100

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorTextRangeCollection => 101

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorTextRectangle => 102

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorTextRectangleList => 103

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorWindow => 104

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorXDomainRequest => 105

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorXMLHttpRequest => 106

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructorMax => 107

    /**
     * @type {Integer (Int32)}
     */
    static DomConstructor_Max => 2147483647
}
