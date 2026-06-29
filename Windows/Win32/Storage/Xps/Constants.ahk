#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Xps
 */

;@region Constants

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_SIGREQUESTID_DUP := -2142108795

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_PACKAGE_NOT_OPENED := -2142108794

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_PACKAGE_ALREADY_OPENED := -2142108793

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_SIGNATUREID_DUP := -2142108792

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MARKUP_COMPATIBILITY_ELEMENTS := -2142108791

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_OBJECT_DETACHED := -2142108790

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_INVALID_SIGNATUREBLOCK_MARKUP := -2142108789

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_INVALID_NUMBER_OF_POINTS_IN_CURVE_SEGMENTS := -2142108160

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_ABSOLUTE_REFERENCE := -2142108159

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_INVALID_NUMBER_OF_COLOR_CHANNELS := -2142108158

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_INVALID_LANGUAGE := -2142109696

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_INVALID_NAME := -2142109695

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_INVALID_RESOURCE_KEY := -2142109694

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_INVALID_PAGE_SIZE := -2142109693

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_INVALID_BLEED_BOX := -2142109692

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_INVALID_THUMBNAIL_IMAGE_TYPE := -2142109691

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_INVALID_LOOKUP_TYPE := -2142109690

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_INVALID_FLOAT := -2142109689

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_UNEXPECTED_CONTENT_TYPE := -2142109688

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_INVALID_FONT_URI := -2142109686

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_INVALID_CONTENT_BOX := -2142109685

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_INVALID_MARKUP := -2142109684

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_INVALID_XML_ENCODING := -2142109683

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_INVALID_CONTENT_TYPE := -2142109682

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_INVALID_OBFUSCATED_FONT_URI := -2142109681

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_UNEXPECTED_RELATIONSHIP_TYPE := -2142109680

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_UNEXPECTED_RESTRICTED_FONT_RELATIONSHIP := -2142109679

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MISSING_NAME := -2142109440

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MISSING_LOOKUP := -2142109439

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MISSING_GLYPHS := -2142109438

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MISSING_SEGMENT_DATA := -2142109437

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MISSING_COLORPROFILE := -2142109436

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MISSING_RELATIONSHIP_TARGET := -2142109435

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MISSING_RESOURCE_RELATIONSHIP := -2142109434

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MISSING_FONTURI := -2142109433

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MISSING_DOCUMENTSEQUENCE_RELATIONSHIP := -2142109432

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MISSING_DOCUMENT := -2142109431

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MISSING_REFERRED_DOCUMENT := -2142109430

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MISSING_REFERRED_PAGE := -2142109429

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MISSING_PAGE_IN_DOCUMENT := -2142109428

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MISSING_PAGE_IN_PAGEREFERENCE := -2142109427

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MISSING_IMAGE_IN_IMAGEBRUSH := -2142109426

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MISSING_RESOURCE_KEY := -2142109425

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MISSING_PART_REFERENCE := -2142109424

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MISSING_RESTRICTED_FONT_RELATIONSHIP := -2142109423

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MISSING_DISCARDCONTROL := -2142109422

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MISSING_PART_STREAM := -2142109421

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_UNAVAILABLE_PACKAGE := -2142109420

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_DUPLICATE_RESOURCE_KEYS := -2142109184

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MULTIPLE_RESOURCES := -2142109183

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MULTIPLE_DOCUMENTSEQUENCE_RELATIONSHIPS := -2142109182

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MULTIPLE_THUMBNAILS_ON_PAGE := -2142109181

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MULTIPLE_THUMBNAILS_ON_PACKAGE := -2142109180

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MULTIPLE_PRINTTICKETS_ON_PAGE := -2142109179

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MULTIPLE_PRINTTICKETS_ON_DOCUMENT := -2142109178

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MULTIPLE_PRINTTICKETS_ON_DOCUMENTSEQUENCE := -2142109177

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MULTIPLE_REFERENCES_TO_PART := -2142109176

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_DUPLICATE_NAMES := -2142109175

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_STRING_TOO_LONG := -2142108928

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_TOO_MANY_INDICES := -2142108927

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MAPPING_OUT_OF_ORDER := -2142108926

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MAPPING_OUTSIDE_STRING := -2142108925

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_MAPPING_OUTSIDE_INDICES := -2142108924

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_CARET_OUTSIDE_STRING := -2142108923

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_CARET_OUT_OF_ORDER := -2142108922

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_ODD_BIDILEVEL := -2142108921

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_ONE_TO_ONE_MAPPING_EXPECTED := -2142108920

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_RESTRICTED_FONT_NOT_OBFUSCATED := -2142108919

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_NEGATIVE_FLOAT := -2142108918

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_XKEY_ATTR_PRESENT_OUTSIDE_RES_DICT := -2142108672

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_DICTIONARY_ITEM_NAMED := -2142108671

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_NESTED_REMOTE_DICTIONARY := -2142108670

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_INDEX_OUT_OF_RANGE := -2142108416

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_VISUAL_CIRCULAR_REF := -2142108415

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_NO_CUSTOM_OBJECTS := -2142108414

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_ALREADY_OWNED := -2142108413

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_RESOURCE_NOT_OWNED := -2142108412

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_UNEXPECTED_COLORPROFILE := -2142108411

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_COLOR_COMPONENT_OUT_OF_RANGE := -2142108410

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_BOTH_PATHFIGURE_AND_ABBR_SYNTAX_PRESENT := -2142108409

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_BOTH_RESOURCE_AND_SOURCEATTR_PRESENT := -2142108408

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_BLEED_BOX_PAGE_DIMENSIONS_NOT_IN_SYNC := -2142108407

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_RELATIONSHIP_EXTERNAL := -2142108406

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_NOT_ENOUGH_GRADIENT_STOPS := -2142108405

/**
 * @type {Integer (Int32)}
 */
export global XPS_E_PACKAGE_WRITER_NOT_CLOSED := -2142108404
;@endregion Constants
