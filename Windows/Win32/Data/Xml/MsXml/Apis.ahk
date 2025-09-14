#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class MsXml {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static E_XML_NOTWF => -1072897501

    /**
     * @type {Integer (Int32)}
     */
    static E_XML_NODTD => -1072897500

    /**
     * @type {Integer (Int32)}
     */
    static E_XML_INVALID => -1072897499

    /**
     * @type {Integer (Int32)}
     */
    static E_XML_BUFFERTOOSMALL => -1072897498

    /**
     * @type {Integer (UInt32)}
     */
    static XHR_PROP_ONDATA_ALWAYS => 0

    /**
     * @type {Integer (UInt64)}
     */
    static XHR_PROP_ONDATA_NEVER => 18446744073709551615

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XOBJ_MIN => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XOBJ_MAX => 131071

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XOBJ_BASE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLELEMENTCOLLECTION => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLELEMENTCOLLECTION_LENGTH => 65537

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_XMLELEMENTCOLLECTION_NEWENUM => -4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLELEMENTCOLLECTION_ITEM => 65539

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOCUMENT => 65636

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOCUMENT_ROOT => 65637

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOCUMENT_FILESIZE => 65638

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOCUMENT_FILEMODIFIEDDATE => 65639

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOCUMENT_FILEUPDATEDDATE => 65640

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOCUMENT_URL => 65641

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOCUMENT_MIMETYPE => 65642

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOCUMENT_READYSTATE => 65643

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOCUMENT_CREATEELEMENT => 65644

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOCUMENT_CHARSET => 65645

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOCUMENT_VERSION => 65646

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOCUMENT_DOCTYPE => 65647

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOCUMENT_DTDURL => 65648

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOCUMENT_ASYNC => 65649

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOCUMENT_CASEINSENSITIVE => 65650

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOCUMENT_BASEURL => 65651

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOCUMENT_XML => 65652

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOCUMENT_LASTERROR => 65653

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOCUMENT_TRIMWHITESPACE => 65654

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOCUMENT_COMMIT => 65655

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLELEMENT => 65736

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLELEMENT_TAGNAME => 65737

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLELEMENT_PARENT => 65738

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLELEMENT_SETATTRIBUTE => 65739

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLELEMENT_GETATTRIBUTE => 65740

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLELEMENT_REMOVEATTRIBUTE => 65741

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLELEMENT_CHILDREN => 65742

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLELEMENT_TYPE => 65743

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLELEMENT_TEXT => 65744

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLELEMENT_ADDCHILD => 65745

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLELEMENT_REMOVECHILD => 65746

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLELEMENT_ATTRIBUTES => 65747

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLNOTIFSINK => 65836

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLNOTIFSINK_CHILDADDED => 65837

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLATTRIBUTE => 65936

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLATTRIBUTE_NAME => 65937

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLATTRIBUTE_VALUE => 65938

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLERROR => 65936

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLERROR_REASON => 65937

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLERROR_LINE => 65938

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLERROR_POS => 65939

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NODE => 66036

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NODE_NAME => 66037

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NODE_PARENT => 66038

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NODE_TYPE => 66039

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NODE_VALUE => 66040

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NODE_SETATTRIBUTE => 66041

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NODE_GETATTRIBUTE => 66042

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NODE_REMOVEATTRIBUTE => 66043

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NODE_ATTRIBUTES => 66044

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NODE_ADD => 66045

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NODE_REMOVE => 66046

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NODE_CHILDREN => 66047

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NODELIST => 66136

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NODELIST_NEWENUM => 66137

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NODELIST_NEXT => 66138

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NODELIST_CURRENT => 66139

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NODELIST_MOVE => 66140

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NODELIST_MOVETONODE => 66141

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NODELIST_LENGTH => 66142

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_NODELIST_ITEM => 66143

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_BASE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_COLLECTION_BASE => 1000000

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_COLLECTION_MAX => 2999999

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NODE_NODENAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NODE_NODEVALUE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NODE_NODETYPE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NODE_NODETYPEENUM => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NODE_PARENTNODE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NODE_CHILDNODES => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NODE_FIRSTCHILD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NODE_LASTCHILD => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NODE_PREVIOUSSIBLING => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NODE_NEXTSIBLING => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NODE_ATTRIBUTES => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NODE_INSERTBEFORE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NODE_REPLACECHILD => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NODE_REMOVECHILD => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NODE_APPENDCHILD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NODE_HASCHILDNODES => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NODE_OWNERDOC => 18

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NODE_CLONENODE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NODE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NODE_STRINGTYPE => 21

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NODE_SPECIFIED => 22

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NODE_DEFINITION => 23

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NODE_TEXT => 24

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NODE_NODETYPEDVALUE => 25

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NODE_DATATYPE => 26

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NODE_XML => 27

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NODE_TRANSFORMNODE => 28

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NODE_SELECTNODES => 29

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NODE_SELECTSINGLENODE => 30

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NODE_PARSED => 31

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NODE_NAMESPACE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NODE_PREFIX => 33

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NODE_BASENAME => 34

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NODE_TRANSFORMNODETOOBJECT => 35

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NODE__TOP => 36

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DOCUMENT => 37

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DOCUMENT_DOCTYPE => 38

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DOCUMENT_IMPLEMENTATION => 39

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DOCUMENT_DOCUMENTELEMENT => 40

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DOCUMENT_CREATEELEMENT => 41

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DOCUMENT_CREATEDOCUMENTFRAGMENT => 42

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DOCUMENT_CREATETEXTNODE => 43

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DOCUMENT_CREATECOMMENT => 44

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DOCUMENT_CREATECDATASECTION => 45

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DOCUMENT_CREATEPROCESSINGINSTRUCTION => 46

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DOCUMENT_CREATEATTRIBUTE => 47

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DOCUMENT_CREATEENTITY => 48

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DOCUMENT_CREATEENTITYREFERENCE => 49

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DOCUMENT_GETELEMENTSBYTAGNAME => 50

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DOCUMENT_TOP => 51

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT => 52

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT_DOCUMENTNODE => 53

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT_CREATENODE => 54

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT_CREATENODEEX => 55

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT_NODEFROMID => 56

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT_DOCUMENTNAMESPACES => 57

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT_LOAD => 58

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT_PARSEERROR => 59

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT_URL => 60

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT_ASYNC => 61

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT_ABORT => 62

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT_LOADXML => 63

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT_SAVE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT_VALIDATE => 65

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT_RESOLVENAMESPACE => 66

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT_PRESERVEWHITESPACE => 67

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT_ONREADYSTATECHANGE => 68

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT_ONDATAAVAILABLE => 69

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT_ONTRANSFORMNODE => 70

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT__TOP => 71

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NODELIST => 72

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NODELIST_ITEM => 73

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NODELIST_LENGTH => 74

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NODELIST => 75

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NODELIST_NEXTNODE => 76

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NODELIST_RESET => 77

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NODELIST_NEWENUM => 78

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NODELIST__TOP => 79

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NAMEDNODEMAP => 80

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NAMEDNODEMAP_GETNAMEDITEM => 83

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NAMEDNODEMAP_SETNAMEDITEM => 84

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NAMEDNODEMAP_REMOVENAMEDITEM => 85

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NAMEDNODEMAP => 86

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NAMEDNODEMAP_GETQUALIFIEDITEM => 87

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NAMEDNODEMAP_REMOVEQUALIFIEDITEM => 88

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NAMEDNODEMAP_NEXTNODE => 89

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NAMEDNODEMAP_RESET => 90

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NAMEDNODEMAP_NEWENUM => 91

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_NAMEDNODEMAP__TOP => 92

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_W3CWRAPPERS => 93

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DOCUMENTFRAGMENT => 94

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DOCUMENTFRAGMENT__TOP => 95

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ELEMENT => 96

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ELEMENT_GETTAGNAME => 97

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ELEMENT_GETATTRIBUTES => 98

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ELEMENT_GETATTRIBUTE => 99

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ELEMENT_SETATTRIBUTE => 100

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ELEMENT_REMOVEATTRIBUTE => 101

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ELEMENT_GETATTRIBUTENODE => 102

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ELEMENT_SETATTRIBUTENODE => 103

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ELEMENT_REMOVEATTRIBUTENODE => 104

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ELEMENT_GETELEMENTSBYTAGNAME => 105

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ELEMENT_NORMALIZE => 106

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ELEMENT__TOP => 107

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DATA => 108

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DATA_DATA => 109

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DATA_LENGTH => 110

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DATA_SUBSTRING => 111

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DATA_APPEND => 112

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DATA_INSERT => 113

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DATA_DELETE => 114

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DATA_REPLACE => 115

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DATA__TOP => 116

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ATTRIBUTE => 117

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ATTRIBUTE_GETNAME => 118

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ATTRIBUTE_SPECIFIED => 119

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ATTRIBUTE_VALUE => 120

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ATTRIBUTE__TOP => 121

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_TEXT => 122

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_TEXT_SPLITTEXT => 123

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_TEXT_JOINTEXT => 124

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_TEXT__TOP => 125

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_PI => 126

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_PI_TARGET => 127

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_PI_DATA => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_PI__TOP => 129

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DOCUMENTTYPE => 130

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DOCUMENTTYPE_NAME => 131

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DOCUMENTTYPE_ENTITIES => 132

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DOCUMENTTYPE_NOTATIONS => 133

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_DOCUMENTTYPE__TOP => 134

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NOTATION => 135

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NOTATION_PUBLICID => 136

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NOTATION_SYSTEMID => 137

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_NOTATION__TOP => 138

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ENTITY => 139

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ENTITY_PUBLICID => 140

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ENTITY_SYSTEMID => 141

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ENTITY_NOTATIONNAME => 142

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ENTITY__TOP => 143

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_W3CWRAPPERS_TOP => 143

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_IMPLEMENTATION => 144

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_IMPLEMENTATION_HASFEATURE => 145

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_IMPLEMENTATION__TOP => 146

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM__TOP => 176

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ERROR => 177

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ERROR_ERRORCODE => 178

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ERROR_URL => 179

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ERROR_REASON => 180

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ERROR_SRCTEXT => 181

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ERROR_LINE => 182

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ERROR_LINEPOS => 183

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ERROR_FILEPOS => 184

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ERROR__TOP => 185

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ERROR2 => 186

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ERROR2_ALLERRORS => 187

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ERROR2_ERRORPARAMETERS => 188

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ERROR2_ERRORPARAMETERSCOUNT => 189

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ERROR2_ERRORXPATH => 190

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ERROR2__TOP => 191

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ERRORCOLLECTION => 192

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ERRORCOLLECTION_LENGTH => 193

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ERRORCOLLECTION_NEXT => 194

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ERRORCOLLECTION_RESET => 195

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_DOM_ERRORCOLLECTION__TOP => 196

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XTLRUNTIME => 186

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XTLRUNTIME_UNIQUEID => 187

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XTLRUNTIME_DEPTH => 188

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XTLRUNTIME_CHILDNUMBER => 189

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XTLRUNTIME_ANCESTORCHILDNUMBER => 190

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XTLRUNTIME_ABSOLUTECHILDNUMBER => 191

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XTLRUNTIME_FORMATINDEX => 192

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XTLRUNTIME_FORMATNUMBER => 193

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XTLRUNTIME_FORMATDATE => 194

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XTLRUNTIME_FORMATTIME => 195

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XTLRUNTIME__TOP => 196

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOMEVENT => 197

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_XMLDOMEVENT_ONREADYSTATECHANGE => -609

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOMEVENT_ONDATAAVAILABLE => 198

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOMEVENT__TOP => 199

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT2 => 200

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT2_NAMESPACES => 201

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT2_SCHEMAS => 202

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT2_VALIDATE => 203

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT2_SETPROPERTY => 204

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT2_GETPROPERTY => 205

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT2__TOP => 206

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT3 => 207

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT3_VALIDATENODE => 208

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT3_IMPORTNODE => 209

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_DOCUMENT3__TOP => 210

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_SCHEMACOLLECTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_SCHEMACOLLECTION_ADD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_SCHEMACOLLECTION_GET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_SCHEMACOLLECTION_REMOVE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_SCHEMACOLLECTION_LENGTH => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_SCHEMACOLLECTION_NAMESPACEURI => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_SCHEMACOLLECTION_ADDCOLLECTION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_SCHEMACOLLECTION__TOP => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_SELECTION => 80

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_SELECTION_EXPR => 81

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_SELECTION_CONTEXT => 82

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_SELECTION_PEEKNODE => 83

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_SELECTION_MATCHES => 84

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_SELECTION_REMOVENEXT => 85

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_SELECTION_REMOVEALL => 86

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_SELECTION_CLONE => 87

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_SELECTION_GETPROPERTY => 88

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_SELECTION_SETPROPERTY => 89

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_SELECTION__TOP => 90

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_TEMPLATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_TEMPLATE_STYLESHEET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_TEMPLATE_CREATEPROCESSOR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_TEMPLATE__TOP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_PROCESSOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_PROCESSOR_INPUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_PROCESSOR_XSLTEMPLATE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_PROCESSOR_SETSTARTMODE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_PROCESSOR_STARTMODE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_PROCESSOR_STARTMODEURI => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_PROCESSOR_OUTPUT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_PROCESSOR_TRANSFORM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_PROCESSOR_RESET => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_PROCESSOR_READYSTATE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_PROCESSOR_ADDPARAMETER => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_PROCESSOR_ADDOBJECT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_PROCESSOR_STYLESHEET => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDOM_PROCESSOR__TOP => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDSO => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDSO_DOCUMENT => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDSO_JAVADSOCOMPATIBLE => 65538

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLREADER__MIN => 1281

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLREADER__MAX => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLREADER__BASE => 1281

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLREADER => 1281

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLREADER_GETFEATURE => 1282

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLREADER_PUTFEATURE => 1283

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLREADER_GETPROPERTY => 1284

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLREADER_PUTPROPERTY => 1285

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLREADER_ENTITYRESOLVER => 1286

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLREADER_CONTENTHANDLER => 1287

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLREADER_DTDHANDLER => 1288

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLREADER_ERRORHANDLER => 1289

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLREADER_BASEURL => 1290

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLREADER_SECUREBASEURL => 1291

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLREADER_PARSE => 1292

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLREADER_PARSEURL => 1293

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLREADER_PARENT => 1294

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLREADER__TOP => 1295

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLFILTER__BASE => 1296

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLFILTER => 1296

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLFILTER_GETFEATURE => 1297

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLFILTER_PUTFEATURE => 1298

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLFILTER_GETPROPERTY => 1299

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLFILTER_PUTPROPERTY => 1300

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLFILTER_ENTITYRESOLVER => 1301

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLFILTER_CONTENTHANDLER => 1302

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLFILTER_DTDHANDLER => 1303

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLFILTER_ERRORHANDLER => 1304

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLFILTER_BASEURL => 1305

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLFILTER_SECUREBASEURL => 1306

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLFILTER_PARSE => 1307

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLFILTER_PARSEURL => 1308

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLFILTER_PARENT => 1309

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_XMLFILTER__TOP => 1311

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_LOCATOR__BASE => 1312

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_LOCATOR => 1312

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_LOCATOR_COLUMNNUMBER => 1313

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_LOCATOR_LINENUMBER => 1314

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_LOCATOR_PUBLICID => 1315

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_LOCATOR_SYSTEMID => 1316

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_LOCATOR__TOP => 1317

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ENTITYRESOLVER__BASE => 1318

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ENTITYRESOLVER => 1318

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ENTITYRESOLVER_RESOLVEENTITY => 1319

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ENTITYRESOLVER__TOP => 1320

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_CONTENTHANDLER__BASE => 1321

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_CONTENTHANDLER => 1321

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_CONTENTHANDLER_DOCUMENTLOCATOR => 1322

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_CONTENTHANDLER_STARTDOCUMENT => 1323

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_CONTENTHANDLER_ENDDOCUMENT => 1324

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_CONTENTHANDLER_STARTPREFIXMAPPING => 1325

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_CONTENTHANDLER_ENDPREFIXMAPPING => 1326

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_CONTENTHANDLER_STARTELEMENT => 1327

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_CONTENTHANDLER_ENDELEMENT => 1328

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_CONTENTHANDLER_CHARACTERS => 1329

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_CONTENTHANDLER_IGNORABLEWHITESPACE => 1330

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_CONTENTHANDLER_PROCESSINGINSTRUCTION => 1331

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_CONTENTHANDLER_SKIPPEDENTITY => 1332

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_CONTENTHANDLER__TOP => 1333

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_DTDHANDLER__BASE => 1334

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_DTDHANDLER => 1334

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_DTDHANDLER_NOTATIONDECL => 1335

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_DTDHANDLER_UNPARSEDENTITYDECL => 1336

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_DTDHANDLER__TOP => 1337

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ERRORHANDLER__BASE => 1338

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ERRORHANDLER => 1338

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ERRORHANDLER_ERROR => 1339

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ERRORHANDLER_FATALERROR => 1340

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ERRORHANDLER_IGNORABLEWARNING => 1341

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ERRORHANDLER__TOP => 1342

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ATTRIBUTES__BASE => 1343

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ATTRIBUTES => 1343

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ATTRIBUTES_LENGTH => 1344

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ATTRIBUTES_GETURI => 1345

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ATTRIBUTES_GETLOCALNAME => 1346

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ATTRIBUTES_GETQNAME => 1347

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ATTRIBUTES_GETINDEXFROMNAME => 1348

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ATTRIBUTES_GETINDEXFROMQNAME => 1349

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ATTRIBUTES_GETTYPE => 1350

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ATTRIBUTES_GETTYPEFROMNAME => 1351

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ATTRIBUTES_GETTYPEFROMQNAME => 1352

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ATTRIBUTES_GETVALUE => 1353

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ATTRIBUTES_GETVALUEFROMNAME => 1354

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ATTRIBUTES_GETVALUEFROMQNAME => 1355

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_ATTRIBUTES__TOP => 1356

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_LEXICALHANDLER__BASE => 1357

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_LEXICALHANDLER => 1357

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_LEXICALHANDLER_STARTDTD => 1358

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_LEXICALHANDLER_ENDDTD => 1359

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_LEXICALHANDLER_STARTENTITY => 1360

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_LEXICALHANDLER_ENDENTITY => 1361

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_LEXICALHANDLER_STARTCDATA => 1362

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_LEXICALHANDLER_ENDCDATA => 1363

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_LEXICALHANDLER_COMMENT => 1364

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_LEXICALHANDLER__TOP => 1365

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_DECLHANDLER__BASE => 1366

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_DECLHANDLER => 1366

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_DECLHANDLER_ELEMENTDECL => 1367

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_DECLHANDLER_ATTRIBUTEDECL => 1368

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_DECLHANDLER_INTERNALENTITYDECL => 1369

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_DECLHANDLER_EXTERNALENTITYDECL => 1370

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SAX_DECLHANDLER__TOP => 1371

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_ATTRIBUTES__BASE => 1372

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_ATTRIBUTES => 1372

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_ATTRIBUTES_ADDATTRIBUTE => 1373

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_ATTRIBUTES_CLEAR => 1374

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_ATTRIBUTES_REMOVEATTRIBUTE => 1375

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_ATTRIBUTES_SETATTRIBUTE => 1376

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_ATTRIBUTES_SETATTRIBUTES => 1377

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_ATTRIBUTES_SETLOCALNAME => 1378

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_ATTRIBUTES_SETQNAME => 1379

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_ATTRIBUTES_SETTYPE => 1380

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_ATTRIBUTES_SETURI => 1381

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_ATTRIBUTES_SETVALUE => 1382

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_ATTRIBUTES_ADDATTRIBUTEFROMINDEX => 1383

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_ATTRIBUTES__TOP => 1383

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_WRITER__BASE => 1384

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_WRITER => 1384

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_WRITER_OUTPUT => 1385

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_WRITER_DESTINATION => 1386

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_WRITER_ENCODING => 1387

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_WRITER_BYTEORDERMARK => 1388

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_WRITER_INDENT => 1389

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_WRITER_STANDALONE => 1390

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_WRITER_OMITXMLDECLARATION => 1391

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_WRITER_VERSION => 1392

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_WRITER_DISABLEOUTPUTESCAPING => 1393

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_WRITER_FLUSH => 1394

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_WRITER_RESET => 1395

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_WRITER__TOP => 1396

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_READER_CONTROL__BASE => 1397

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_READER_CONTROL => 1397

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_READER_CONTROL_ABORT => 1398

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_READER_CONTROL_RESUME => 1399

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_READER_CONTROL_SUSPEND => 1400

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_READER_CONTROL__TOP => 1401

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_SCHEMADECLHANDLER__BASE => 1402

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_SCHEMADECLHANDLER => 1402

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_SCHEMADECLHANDLER_SCHEMAELEMENTDECL => 1403

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_SCHEMADECLHANDLER__TOP => 1404

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_NSMGR__BASE => 1405

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_NSMGR => 1405

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_NSMGR_ALLOWOVERRIDE => 1406

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_NSMGR_RESET => 1407

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_NSMGR_PUSHCONTEXT => 1408

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_NSMGR_PUSHNODECONTEXT => 1409

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_NSMGR_POPCONTEXT => 1410

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_NSMGR_DECLAREPREFIX => 1411

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_NSMGR_GETDECLAREDPREFIXES => 1412

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_NSMGR_GETPREFIXES => 1413

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_NSMGR_GETURI => 1414

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_NSMGR_GETURIFROMNODE => 1415

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_NSMGR_LENGTH => 1416

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MX_NSMGR__TOP => 1417

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MXXML_FILTER__BASE => 1418

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MXXML_FILTER => 1418

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MXXML_FILTER_CONTENTHANDLER => 1419

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MXXML_FILTER_DTDHANDLER => 1420

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MXXML_FILTER_ENTITYRESOLVER => 1421

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MXXML_FILTER_ERRORHANDLER => 1422

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MXXML_FILTER_GETFEATURE => 1423

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MXXML_FILTER_GETPROPERTY => 1424

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MXXML_FILTER_PUTFEATURE => 1425

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MXXML_FILTER_PUTPROPERTY => 1426

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_MXXML_FILTER__TOP => 1427

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM => 1418

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_VALIDATE => 1419

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_VALIDATEONLOAD => 1420

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_GETSCHEMA => 1421

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_GETDECLARATION => 1422

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_ITEMBYNAME => 1423

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_ITEMBYQNAME => 1424

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_ANYATTRIBUTE => 1425

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_ATTRIBUTEGROUPS => 1426

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_ATTRIBUTES => 1427

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_BASETYPES => 1428

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_CONTENTMODEL => 1429

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_CONTENTTYPE => 1430

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_DEFAULTVALUE => 1431

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_DERIVEDBY => 1432

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_DISALLOWED => 1433

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_ELEMENTS => 1434

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_ENUMERATION => 1435

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_FIELDS => 1436

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_FINAL => 1437

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_FIXEDVALUE => 1438

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_FRACTIONDIGITS => 1439

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_ID => 1440

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_IDCONSTRAINTS => 1441

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_ISABSTRACT => 1442

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_ISNILLABLE => 1443

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_ISREFERENCE => 1444

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_ISVALID => 1445

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_ITEMTYPE => 1446

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_LENGTH => 1447

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_MAXEXCLUSIVE => 1448

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_MAXINCLUSIVE => 1449

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_MAXLENGTH => 1450

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_MAXOCCURS => 1451

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_MINEXCLUSIVE => 1452

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_MININCLUSIVE => 1453

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_MINLENGTH => 1454

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_MINOCCURS => 1455

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_MODELGROUPS => 1456

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_NAME => 1457

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_NAMESPACES => 1458

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_NAMESPACEURI => 1459

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_NOTATIONS => 1460

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_PARTICLES => 1461

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_PATTERNS => 1462

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_PROCESSCONTENTS => 1463

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_PROHIBITED => 1464

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_PUBLICIDENTIFIER => 1465

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_REFERENCEDKEY => 1466

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_SCHEMA => 1467

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_SCHEMALOCATIONS => 1468

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_SCOPE => 1469

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_SELECTOR => 1470

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_SUBSTITUTIONGROUP => 1471

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_EXCLUSIONS => 1472

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_SYSTEMIDENTIFIER => 1473

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_TARGETNAMESPACE => 1474

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_TOTALDIGITS => 1475

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_TYPE => 1476

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_TYPES => 1477

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_UNHANDLEDATTRS => 1478

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_USE => 1479

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_VARIETY => 1480

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_VERSION => 1481

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_WHITESPACE => 1482

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_WRITEANNOTATION => 1483

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_SOM_TOP => 1484

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDSIG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDSIG_CREATEKEYFROMCSP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDSIG_CREATEKEYFROMHMACSECRET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDSIG_CREATEKEYFROMNODE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDSIG_CREATESAXPROXY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDSIG_GETVERIFYINGCERTIFICATE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDSIG_SETREFERENCEDATA => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDSIG_SIGN => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDSIG_SIGNATURE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDSIG_STORE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_XMLDSIG_VERIFY => 10
;@endregion Constants

;@region Methods
;@endregion Methods
}
